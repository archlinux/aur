# Maintainer: Polarian <polarian@polarian.dev>
pkgname=onedev-docs
pkgver=20230211
pkgrel=1
pkgdesc="Static site documentation for Onedev for offline browsing"
arch=('any')
url="https://code.onedev.io/onedev/docs"
license=('unknown')
makedepends=('nodejs' 'yarn' 'git' 'git-lfs')
optdepends=('python: For http server following ArchWiki guide'
            'nginx: For http server, python http is recommended')

prepare() {
  if [ -d $pkgname ]; then
    cd $pkgname
    git pull origin main
  else
    git clone https://code.onedev.io/onedev/docs onedev-docs
    cd $pkgname
  fi

  # Checkout the commit designed to build
  git checkout c1b54f99fe354e3c863fcf80d6bf5ce1746eb336

  # Pull dependencies before building, allows offline building
  yarn
}

build() {
  # Build the static site
  cd onedev-docs/
  yarn build
}

package() {
  # Copy the static site to /usr/share/doc/onedev/html
  install -dm755 "$pkgdir/usr/share/doc/onedev/html"
  cp -r onedev-docs/build/* "$pkgdir/usr/share/doc/onedev/html/"
}

# vim:set ts=2 sw=2 et:
