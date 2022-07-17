# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: thn81 <root@scrat>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=bamf, repo=yakkety
# vercheck-launchpad: name=bamf

pkgname=bamf-ubuntu
_actual_ver=0.5.6
_extra_ver=+22.04.20220217
pkgver=${_actual_ver}${_extra_ver//[\~\+]/.}
pkgrel=1
pkgdesc="Removes the headache of applications matching into a simple DBus daemon and c wrapper library"
arch=(i686 x86_64)
url="https://launchpad.net/bamf"
license=(GPL)
depends=(libgtop libwnck3 glib2 hicolor-icon-theme libdbusmenu-gtk3 procps-ng
         startup-notification perl)
makedepends=(gnome-common gobject-introspection gtk-doc libxml2 libxslt vala python-lxml)
provides=("bamf=${pkgver}")
replaces=(bamf)
conflicts=(bamf)
groups=(unity)
install=${pkgname}.install
source=("https://launchpad.net/ubuntu/+archive/primary/+files/bamf_${_actual_ver}${_extra_ver}.orig.tar.gz"
        update-bamf-index.hook
        update-bamf-index.pl
        update-bamf-index.sh)
sha512sums=('4a2ae181cb717d5f341e39fdd43fa2e401e528e2341406b034e47da3373984e3f0dde6330c667fdf6fe0b84f1f4941aa0a5609c3ba8d9c564bab11de7aff74fc'
            '49379121974a6f273084f66c6aa937fd2213e92169040db03f87098d3ca269032603f3dbfec947807e3d4a3c866648b96a2a3bb18f1ad3736a7ceaf011cf901a'
            '7db84774b72fb330abe2116f3d1d842c007820c200344d76ff87abab5226488fcc21d2e82cbe5381fb3e7ce0eacc09232f17d64c4e2a5ee8eef0be06808f21ff'
            '6dd8079a1dddc787d41fea246809e37de76a6e6daa2e3760c4a6770456fd1d8097597cadeae38fd81f322d44e79f0786e82604d606bc81bae57f39091db0755c')

prepare() {
    #cd "bamf-${_actual_ver}${_extra_ver}"

    sed -i 's/-Werror/-Wno-error/g' configure.ac
}

build() {
    #cd "bamf-${_actual_ver}${_extra_ver}"

    gtkdocize
    autoreconf -vfi

    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib \
        --disable-static \
        --enable-gtk-doc \
        --enable-export-actions-menu=yes

    make
}

package() {
    #cd "bamf-${_actual_ver}${_extra_ver}"

    make DESTDIR="${pkgdir}/" install

    install -m755 ../update-bamf-index.pl "${pkgdir}"/usr/lib/bamf/
    install -m755 ../update-bamf-index.sh "${pkgdir}"/usr/lib/bamf/
    install -dm755 "${pkgdir}"/usr/share/libalpm/hooks/
    install -m644 ../update-bamf-index.hook "${pkgdir}"/usr/share/libalpm/hooks/

    rm -rv "${pkgdir}"/usr/share/upstart/
}
