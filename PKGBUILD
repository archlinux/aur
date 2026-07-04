# Maintainer: Jacob Morgan <arch_aur@slackspace.io>
pkgname=rotorflight-configurator
pkgver=2.3.0
# You'll need to update this dynamically
pkgrel=1
pkgdesc="Rotorflight Configurator for Rotorflight FBL Controller"
arch=('x86_64')
url="https://github.com/rotorflight/rotorflight-configurator"
license=('MIT')
depends=('python' 'nodejs' 'npm')
makedepends=('pnpm' 'nvm' 'git')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rotorflight/rotorflight-configurator/archive/refs/tags/release/${pkgver}.tar.gz"
        "$pkgname.desktop")
sha512sums=('808add57eeaac2463d92db6fc6857a5034ca11bc163e723531dceae85ec0bf8500c36f90d38fa619eeb9b0a8798f6881e4dc18fd14722b1900e826c76e2ddd59'
            '415dd974a570d35fd0c42004005584a8da0c91cf2d3bb030f42ce068ada27a31c2d517637b962f1085266a0e6c2dce1dda6230cdcb1d65de85b9761f48accb06')


_ensure_local_nvm() {
    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  pwd

  cd "${pkgname}-release-${pkgver}"
  echo "allowBuildScripts=always" > .npmrc
  _ensure_local_nvm
  cat > pnpm-workspace.yaml << 'EOF'
allowBuilds:
  '@fortawesome/fontawesome-free': true
  es5-ext: true
  nw-builder: true
  '@parcel/watcher': true
  
EOF
  # Install dependencies without building yet
  # vite.config.mjs shells out to `git rev-parse --short HEAD` for a
  # version string, but a tarball source has no .git — fake one:
  if [ ! -d .git ]; then
    git init -q
    git config user.email "build@localhost"
    git config user.name "makepkg"
    git add -A
    git commit -q -m "snapshot for build" --allow-empty
  fi
  
  nvm install 25
  echo "prepare"
#  pnpm install --no-frozen-lockfile  
}

build() {
  cd "${pkgname}-release-${pkgver}"

  _ensure_local_nvm
  echo "allowBuildScripts=always" > .npmrc
  make version SEMVER="${pkgver}"
  echo "build"
  pnpm gulp app --platform linux --arch x86_64
#  pnpm gulp app --linux64 --frozen-lockfile
}

package() {
  cd "${pkgname}-release-${pkgver}"
  install -d "$pkgdir/opt/$pkgname/"
  cp -r  app/linux_x86_64/* "${pkgdir}/opt/$pkgname/"
  chmod -R a=u,g-w,o-w "$pkgdir/opt/$pkgname/"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -d "$pkgdir/usr/bin/"
  ln -s /opt/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"

}


