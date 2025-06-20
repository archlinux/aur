# Maintainer: Janek Thomaschewski <janek@thomaschewski.dev>
# Contributor: Steve Engledow <steve@engledow.me>

pkgname=amazon-workspaces-bin
pkgver=2025.0.5219
pkgrel=1
_aptdist=focal
pkgdesc='Amazon Workspace Client'
arch=('x86_64')
url="https://clients.amazonworkspaces.com/"
license=('non-free')
depends=(
    'gtk3'
    'webkit2gtk'
    'icu'
    'libsoup'
    'graphicsmagick'
    'hiredis0.14'
    'openssl-1.1'
    'libva'
    'libvdpau'
    'glib2'
)
options=('staticlibs')
makedepends=(
  'binutils'
  'tar'
)
source=(
    "$pkgname-$pkgver.deb::https://d3nt0h4h6pmmc4.cloudfront.net/new_workspacesclient_${_aptdist}_amd64.deb"
    "$pkgname-$pkgver.info::https://d3nt0h4h6pmmc4.cloudfront.net/ubuntu/dists/${_aptdist}/main/binary-amd64/Packages"
    lsb_release
    workspacesclient-wrapper
)

sha256sums=('181c4a10a9a745b67769c063c0c67355db9f71d63aab14ab46699e68898d32ec'
            'dcecbe5b5286c898fdac801768a55679e70058f9647ad25e38d14805ab1694ad'
            'fb7640c4d5dbb507d6443462eabf1384dd65f069b33a9abc4a599d41ac6d0fb6'
            '27c7e51d9434e4cf85d898179ab1b0477b9c695e3461a7403da4e2c37857474f')

prepare() {
    # Verify the checksum
    echo "$(grep SHA256 "$pkgname-$pkgver.info" | cut -d" " -f2) $pkgname-$pkgver.deb" >sum
    sha256sum -c sum

    ar x "$pkgname-$pkgver.deb"
    tar axvf data.tar.xz
    tar axvf control.tar.xz

    # Put "fake" lsb_release into PATH to report Ubuntu 20.x
    mkdir -p ${srcdir}/usr/lib/${arch}-linux-gnu/workspacesclient/helper-bin
    install -m 0755 ${srcdir}/lsb_release ${srcdir}/usr/lib/${arch}-linux-gnu/workspacesclient/helper-bin/

    install -m 0755 ${srcdir}/workspacesclient-wrapper ${srcdir}/usr/bin/

    sed -i -e 's/Exec=workspacesclient/Exec=workspacesclient-wrapper/' ${srcdir}/usr/share/applications/com.amazon.workspacesclient.desktop

    # Remove a couple of vendored-in libraries, so the system ones are used
    # The vendored-in version has libselinux.so.1 linked, which doesn't exist natively on Arch
    rm ${srcdir}/usr/lib/${arch}-linux-gnu/workspacesclient/dcv/libgio-2.0.so.0
    rm ${srcdir}/usr/lib/${arch}-linux-gnu/workspacesclient/dcv/libglib-2.0.so.0
    rm ${srcdir}/usr/lib/${arch}-linux-gnu/workspacesclient/dcv/libgobject-2.0.so.0

    # The below preparation steps are adapted from the .deb
    export LD_LIBRARY_PATH=${srcdir}/usr/lib/${arch}-linux-gnu/workspacesclient/dcv:$LD_LIBRARY_PATH
    export PATH=${srcdir}/usr/lib/${arch}-linux-gnu/workspacesclient/dcv:$PATH
    gdk-pixbuf-query-loaders ${srcdir}/usr/lib/${arch}-linux-gnu/workspacesclient/dcv/gdk-pixbuf-2.0/2.10.0/loaders/*.so | \
        sed "s|^\"${srcdir}|\"|" > ${srcdir}/usr/lib/${arch}-linux-gnu/workspacesclient/dcv/gdk-pixbuf-2.0/2.10.0/loaders.cache
    gtk-query-immodules-3.0 ${srcdir}/usr/lib/${arch}-linux-gnu/workspacesclient/dcv/gtk-3.0/3.0.0/immodules/*.so | \
        sed "s|^\"${srcdir}|\"|" > ${srcdir}/usr/lib/${arch}-linux-gnu/workspacesclient/dcv/gtk-3.0/3.0.0/immodules.cache
}

pkgver() {
    grep Version control | cut -d" " -f2
}

package() {
  mkdir -p $pkgdir/usr

  cp -a $srcdir/usr/* $pkgdir/usr/
}
