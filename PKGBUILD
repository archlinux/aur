# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Berseker <berseker86 at gmail.com>

pkgname=viewnior-git
pkgver=1.8.r0.g4a4c6e8
pkgrel=2
pkgdesc="Simple, fast, elegant and minimalistic image viewer, written in C(GTK+) with a new GtkImageView library. Git Version"
arch=('i686' 'x86_64')
url='http://siyanpanayotov.com/project/viewnior'
license=('GPL')
depends=('exiv2' 'gtk3')
makedepends=('gnome-common' 'intltool' 'meson' 'ninja' 'glib2-devel')
provides=('viewnior')
conflicts=('viewnior')
source=(
    "${pkgname}::git+https://github.com/hellosiyan/Viewnior.git"
    'https://patch-diff.githubusercontent.com/raw/hellosiyan/Viewnior/pull/108.patch' #use gtk3 instead of gtk2
    'https://patch-diff.githubusercontent.com/raw/hellosiyan/Viewnior/pull/130.patch' #fix compiling with exiv2 >=0.28.0
    'https://patch-diff.githubusercontent.com/raw/hellosiyan/Viewnior/pull/135.patch' #fix viewing images in gvfs mounts (ssh, smb)
)
md5sums=(
    'SKIP'
    '3ddc5cfffd9c8e856646b8ceb96780ce'
    '975eeae744a613e326b89b5dd4ef1fbe'
    '5df6ff28e88322956b981c446fd5dfb1'
)

pkgver()
{
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/viewnior.//'
}

prepare()
{
    cd "${srcdir}/${pkgname}"
    sed -zi.bak 's|\s\\ No newline at end of file||' "${srcdir}/108.patch"
    patch --forward --strip=1 --input="${srcdir}/108.patch"
    patch --forward --strip=1 --input="${srcdir}/130.patch"
    patch --forward --strip=1 --input="${srcdir}/135.patch"
}


build()
{
    cd "${srcdir}/${pkgname}"
    meson builddir --prefix=/usr
    ninja -C builddir
}

package()
{
    cd "${srcdir}/${pkgname}"
    DESTDIR="${pkgdir}" ninja -C builddir install
}
