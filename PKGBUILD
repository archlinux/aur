# Maintainer: William Gathoye <william at gathoye dot be>
# Contributor:

pkgname=progit2
pkgver=2.1.51
pkgrel=1
pkgdesc="The offline version of the entire Pro Git book, written by Scott Chacon and Ben Straub"
arch=('any')

url="https://git-scm.com/book/en/v2"
license=('CCPL:by-nc-sa')

makedepends=(
  'ruby-bundler'
  'ruby'
  'python2'
)
provides=('progit2')
conflicts=('progit2')

install=${pkgname}.install

source=(
    "https://github.com/progit/progit2/archive/${pkgver}.tar.gz"
)
sha512sums=(
    068a78ea590aefdc11ddd49c6fde39883d72ce55593fddd38e2be2e14976e68b6609e69515863a8374b72fcb40b413d4c0763ee9fbd84fdffc69ef2e796194df
)

prepare() {
    cd "${pkgname}-${pkgver}"
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
    cd "${pkgname}-${pkgver}"
    bundle exec rake book:build
}

package() {
    cd "${pkgname}-${pkgver}"

    # Install to /usr/share/doc/progit2
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname%-git}/"
    cp progit.epub "${pkgdir}/usr/share/doc/${pkgname%-git}/"
    cp progit-kf8.epub "${pkgdir}/usr/share/doc/${pkgname%-git}/"
    cp progit.mobi "${pkgdir}/usr/share/doc/${pkgname%-git}/"
    cp progit.pdf "${pkgdir}/usr/share/doc/${pkgname%-git}/"
    cp progit.html "${pkgdir}/usr/share/doc/${pkgname%-git}/"
    cp -a images "${pkgdir}/usr/share/doc/${pkgname%-git}/"
}
