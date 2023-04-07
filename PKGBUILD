# Maintainer: Pig2014 <cattysteve89265@163.com>

pkgname=collabora-online-server-git
pkgver=23.05.0.1
pkgrel=1
pkgdesc="A collaborative online office suite based on LibreOffice technology"
url="https://collaboraonline.github.io"
arch=(x86_64)
license=("MPL")
depends=("libcap" "libcap-ng" "lib32-libcap" "libpng" "poco" "cppunit" "nodejs" "npm" "python-lxml" "python-polib" "cpio")
makedepends=("chromium")
backup=("etc/coolwsd/coolwsd.xml")
source=("git+https://github.com/CollaboraOnline/online.git"
        "https://github.com/CollaboraOnline/online/releases/download/for-code-assets/core-co-23.05-assets.tar.gz"
        "coolwsd.patch"
        "service.patch")

sha512sums=('SKIP'
            'SKIP'
            '227a317874775398081275d9ee4aadb8b75deb1cbdae404646957439057645525f42e2fe6ae3cd79d11d3132529facca5cb680690f28e3c6846c57395d7f71a6'
            '4845fc0f23e56b4fbec129b5d90db02aab02aeb55ab028f7c6fa2b42911026f6f4c02dff61debd298b7f7448c843884aa0b813f52ee34f53e0925ee4a58a1026')
install="collabora-online-server-git.install"

prepare() {
    patch online/coolwsd.xml.in coolwsd.patch
    patch online/coolwsd.service service.patch
}

build() {
    cd online
    ./autogen.sh
    ./configure --enable-silent-rules --with-lokit-path="${srcdir}"/include --with-lo-path=/usr/share/coolwsd/libreoffice --disable-werror --disable-setcap
    cd "${srcdir}"/online
    make
}

package() {
    cd "${srcdir}"/online
    make install DESTDIR="${pkgdir}"
    cd "${pkgdir}"/usr/local/
    mv etc ../../
    mv bin ../
    mv share ../
    cd ..
    rm local -r
    cd "${pkgdir}"/etc
    mkdir -p httpd/conf/extra
    mv apache2/conf-available/coolwsd.conf httpd/conf/extra/
    rm -r apache2
    cd "${pkgdir}"
    mkdir -p var/lib/coolwsd/systemplate
    cp -r "${srcdir}"/instdir "${pkgdir}"/usr/share/coolwsd/libreoffice
    mkdir -p usr/lib/systemd/system
    cp "${srcdir}"/online/coolwsd.service usr/lib/systemd/system
}

