# Maintainer: Morgan Mullaney  <jump@fastmail.fm>
# Contributor: Techlive Zheng <techlivezheng@gmail.com>

pkgname=google-musicmanager
pkgver=1.0.196.8837_r0
pkgrel=1
pkgdesc="A simple application for adding the music files on your computer to your Google Music library."
arch=('i686' 'x86_64')
url="http://music.google.com"
license=('custom:musicmanager')
depends=('flac' 'fontconfig' 'libogg' 'freetype2' 'libvorbis' 'xdg-utils' 'libidn' 'qtwebkit')
optdepends=('log4cxx')
options=(!strip)
install=${pkgname}.install

if [ "$CARCH" = "x86_64" ]; then
    _arch='amd64'
    md5sums=('03987c7a6b53dee9d75fe15dd9aed0f9')
elif [ "$CARCH" = "i686" ]; then
    _arch='i386'
    md5sums=('663ff763de2f01de02218f6fb330ec9d')
fi

source=("google-musicmanager-beta-${_arch}-${pkgver}.deb::http://dl.google.com/linux/direct/google-musicmanager-beta_current_${_arch}.deb")

build() {
    #Get binary sources.
    ar -xv google-musicmanager-beta-${_arch}-${pkgver}.deb
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
        install -D -m644 $pkgdir/opt/google/musicmanager/product_logo_${i}.png $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/google-musicmanager.png
    done

    install -D -m644 $pkgdir/opt/google/musicmanager/google-musicmanager.desktop $pkgdir/usr/share/applications

    ln -s /opt/google/musicmanager/google-musicmanager $pkgdir/usr/bin/
}
