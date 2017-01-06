# Maintainer: William Gathoye <william at gathoye dot be>
# Contributor:

pkgname=progit2-git
pkgver=2.0.0.r689.g5026c45
pkgrel=1
pkgdesc="A package to build the latest version of the progit2 book and read it when offline"
arch=('any')

url="https://github.com/progit/progit2"
license=('CCPL')

makedepends=(
  'git'
  'ruby-bundler'
  'ruby'
  'python2'
)

install=${pkgname}.install

source=('git+https://github.com/progit/progit2')
sha512sums=('SKIP')

# Get the most recent un-annotated tag reachable from the last commit
pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"

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

    # Override the directory 
    export GEM_HOME=".bundle"

    bundle install
}

package() {
    # When entering here, we are in the src directory, go in the cloned progit2
    # directory.
    cd "$srcdir/${pkgname%-git}"

    bundle exec rake book:build

    # Install to /usr/share/doc/progit2
    install -dm755 "$pkgdir/usr/share/doc/${pkgname%-git}/"
    cp "$srcdir/${pkgname%-git}/progit.epub" "$pkgdir/usr/share/doc/${pkgname%-git}/"
    cp "$srcdir/${pkgname%-git}/progit-kf8.epub" "$pkgdir/usr/share/doc/${pkgname%-git}/"
    cp "$srcdir/${pkgname%-git}/progit.mobi" "$pkgdir/usr/share/doc/${pkgname%-git}/"
    cp "$srcdir/${pkgname%-git}/progit.pdf" "$pkgdir/usr/share/doc/${pkgname%-git}/"
    cp "$srcdir/${pkgname%-git}/progit.pdfmarks" "$pkgdir/usr/share/doc/${pkgname%-git}/"
    cp "$srcdir/${pkgname%-git}/progit.html" "$pkgdir/usr/share/doc/${pkgname%-git}/"
    cp -a "$srcdir/${pkgname%-git}/images" "$pkgdir/usr/share/doc/${pkgname%-git}/"
}
