# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Morgan Mullaney  <jump@fastmail.fm>
# Contributor: Techlive Zheng <techlivezheng@gmail.com>

pkgname=google-musicmanager
pkgver=1.0.196.8837_r0
pkgrel=2
pkgdesc="A simple application for adding the music files on your computer to your Google Music library."
arch=('i686' 'x86_64')
url="http://music.google.com"
license=('custom:musicmanager')
depends=('flac'
         'fontconfig'
         'libogg'
         'freetype2'
         'libvorbis'
         'xdg-utils'
         'libidn'
         'qtwebkit')
optdepends=('log4cxx')
options=(!strip)
install=${pkgname}.install
source_i686=("https://dl.google.com/linux/musicmanager/deb/pool/main/g/${pkgname}-beta/${pkgname}-beta_${pkgver/_/-}_i386.deb")
source_x86_64=("https://dl.google.com/linux/musicmanager/deb/pool/main/g/${pkgname}-beta/${pkgname}-beta_${pkgver/_/-}_amd64.deb")
md5sums_i686=('663ff763de2f01de02218f6fb330ec9d')
md5sums_x86_64=('03987c7a6b53dee9d75fe15dd9aed0f9')

build() {
    #Get binary sources.
    ar -xv "${pkgname}-beta_${pkgver/_/-}_*.deb"
    tar -xvf data.tar.lzma
    tar -xvf control.tar.gz

    #Debian package source files cleaning.
    rm -r $srcdir/etc
    rm -r $srcdir/usr
    rm -f $srcdir/opt/google/musicmanager/product_logo_32.xpm
}
package() {
    #Auto fetch the latest version.
    install -d $pkgdir/{opt,usr/{bin,share/applications}}

    #Install files.
    cd $srcdir/opt/google/musicmanager
    find . -type d -exec install -d {,${pkgdir}/opt/google/musicmanager/}{} \;
    find . -type f -exec install -D -m 644 {,${pkgdir}/opt/google/musicmanager/}{} \;

    #Make google-musicmanager executable.
    chmod 755 ${pkgdir}/opt/google/musicmanager/{google-musicmanager,minidump_upload,xdg-settings,xdg-mime,MusicManager}

    #Installing icons to /usr/share/icons/hicolor/
    for i in 16 32 48 128
    do
        install -Dm644 $pkgdir/opt/google/musicmanager/product_logo_${i}.png $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/google-musicmanager.png
    done

    install -Dm644 $pkgdir/opt/google/musicmanager/google-musicmanager.desktop $pkgdir/usr/share/applications

    ln -s /opt/google/musicmanager/google-musicmanager $pkgdir/usr/bin/
}
