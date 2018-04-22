# Maintainer: William Gathoye <william at gathoye dot be>
# Contributor:

pkgname=progit2-git
pkgver=2.1.51.r0.g4a3dec9
pkgrel=2
pkgdesc="The offline version of the entire Pro Git book, written by Scott Chacon and Ben Straub"
arch=('any')

url="https://github.com/progit/progit2"
license=('CCPL:by-nc-sa')

makedepends=(
  'git'
  'ruby-bundler'
  'ruby'
  'python2'
)
provides=('progit2')
conflicts=('progit2')

install=${pkgname}.install

source=('git+https://github.com/progit/progit2')
sha512sums=('SKIP')

# Get the most recent un-annotated tag reachable from the last commit
# src.: https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"

    # Gem dependencies can be installed per user and not systemwide in
    # /home/<your username>/.gem/ruby/<ruby version>/, but we won't be able to
    # clean that directory after having build the book, leaving unused
    # dependencies. -> Dirty
    # export GEM_HOME=$(ruby -e 'print Gem.user_dir')


    # Gem dependencies can be installed as an Arch Linux package which is
    # created by tools like gem2arch or pacgem. However, what will happen if
    # package wearing the same name as those installed by these tools appear in
    # the Arch repos? As conflict checks are not performed by these tools, we
    # highly risk package names clashes. -> Too dangerous.

    # Gem dependencies can also be installed in the directory we specify, but
    # the latter will be removed after we have build the book. The PKGBUILD
    # will have to redownload again all these deps if the user wants to update
    # his book. Even if this is quite heavy, this is the cleaner approach we
    # have.
    bundle install --path .bundle
}

build() {
    # When entering here, we are in the src directory, go in the cloned progit2
    # directory.
    cd "${pkgname%-git}"

    bundle exec rake book:build
}

package() {
    # When entering here, we are in the src directory, go in the cloned progit2
    # directory.
    cd "${pkgname%-git}"

    # Install to /usr/share/doc/progit2
    install -dm755 "$pkgdir/usr/share/doc/${pkgname%-git}/"
    cp "$srcdir/${pkgname%-git}/progit.epub" "$pkgdir/usr/share/doc/${pkgname%-git}/"
    cp "$srcdir/${pkgname%-git}/progit-kf8.epub" "$pkgdir/usr/share/doc/${pkgname%-git}/"
    cp "$srcdir/${pkgname%-git}/progit.mobi" "$pkgdir/usr/share/doc/${pkgname%-git}/"
    cp "$srcdir/${pkgname%-git}/progit.pdf" "$pkgdir/usr/share/doc/${pkgname%-git}/"
    cp "$srcdir/${pkgname%-git}/progit.html" "$pkgdir/usr/share/doc/${pkgname%-git}/"
    cp -a "$srcdir/${pkgname%-git}/images" "$pkgdir/usr/share/doc/${pkgname%-git}/"
}
