# Maintainer: ahrs <Forward dot to at hotmail dot co dot uk>

pkgname='cmus-mediakeys'
pkgver=r9.b3852b6
pkgrel=1
arch=('any')
url="https://github.com/nogizhopaboroda/cmus-mediakeys"
depends=('curl' 'git' 'bash' 'make')
conflicts=()
license=("UNLICENSED")
pkgdesc="Control cmus player via global mediakeys"
source=("git+https://github.com/nogizhopaboroda/cmus-mediakeys.git")
md5sums=('SKIP')
install=''

pkgver() {
  cd "$srcdir/cmus-mediakeys"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # The n-install tool checks if nodejs is currently installed.
  # This means if you already have node installed it will fail. You
  # won't have this problem if you build in a clean chroot but since
  # most users probably won't do this we hack around this via some sed
  # magic. Since this is fragile and prone to breakage if you are building
  # in a clean chroot you may set the `ENABLE_N_INSTALL_HACK` environment
  # variable to 0 to bypass this hack.
  if [ -z "$ENABLE_N_INSTALL_HACK" ]
  then
    ENABLE_N_INSTALL_HACK=1
  fi
  if [ "$ENABLE_N_INSTALL_HACK" -eq 1 ]
  then
    curl -s -L https://git.io/n-install | sed 's/\${\#existingExes\[@\]} > 0/\${\#existingExes\[@\]} < -1/g' | N_PREFIX=/$srcdir/opt/$pkgname/n bash -s -- -q -n -y 0.10
  else
    curl -s -L https://git.io/n-install | N_PREFIX=/$srcdir/opt/$pkgname/n bash -s -- -q -n -y 0.10
  fi
  N_PREFIX="$srcdir/opt/$pkgname/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
  PATH="$N_PREFIX/bin:$PATH"
  cd "$srcdir/$pkgname"
  npm install
}

package() {
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  mv "$srcdir/opt" "$pkgdir/"
  chmod 644 "$pkgdir/opt"
  rm -rf "$srcdir/opt"
  install -D -m 644 "$srcdir/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -D -m 644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
  ln -v -s "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -d -m 655 "$pkgdir/opt/$pkgname/node_modules"
  for f in {'mediakeys','package.json'}
  do
    install -D -m 644 "$srcdir/$pkgname/$f" "$pkgdir/opt/$pkgname/$f"
  done
  chmod +x "$pkgdir/opt/$pkgname/mediakeys"
  sed -i "s/\#\!\/usr\/bin\/env node/#\\!\/opt\/$pkgname\/n\/bin\/node/g" "$pkgdir/opt/$pkgname/mediakeys"
  cd "$srcdir/$pkgname/"
  find node_modules -type f | while IFS= read -r file
  do
    install -m 655 -D "${file}" "$pkgdir/opt/$pkgname/node_modules/${file#node_modules/}"
  done
}
