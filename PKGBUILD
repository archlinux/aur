# Maintainer: Polarian <polarian@polarian.dev>
pkgname=onedev-docs
pkgver=20230320
pkgrel=3
pkgdesc="Static site documentation for Onedev for offline browsing"
arch=('any')
url="https://code.onedev.io/onedev/docs"
license=('unknown')
makedepends=('nodejs-lts-hydrogen' 'yarn' 'git' 'git-lfs')
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
  git checkout f3177b6f52b98a7193664cd5aa50652590492ec9

  # Fetch git lfs files
  git lfs fetch

  # Checkout lfs files for the current commit
  git lfs checkout

  # Pull dependencies before building, allows offline building
  yarn
}

build() {
  cd $pkgname

  # Build the static site
  yarn build
}

package() {
  # Copy the static site to /usr/share/doc/onedev/html
  install -dm755 "$pkgdir/usr/share/doc/onedev/html"
  cp -r onedev-docs/build/* "$pkgdir/usr/share/doc/onedev/html/"
}

# vim:set ts=2 sw=2 et:
