# Maintainer: Kristian Gunstone <kristian.gunstone.butnotthispart@pean.northis.org>
# Contributor: Jan-Tarek Butt <tarek@ring0.de>
# This PKGBUILD is based on the 'cura-old' PKGBUILD maintained by Jan-Tarek.
# A specific version of CuraEngine is bundled with Aleph's Cura, and so it also
# comes with this package.
pkgname=cura-aleph-bin
pkgver=18.03
pkgrel=1
pkgdesc="A full 3D printing solution aimed at RepRaps and the Ultimaker. 
This is the Aleph Objects fork, specialized for the Lulzbot series of 3D printers."
arch=('i686' 'x86_64')
url="https://www.lulzbot.com/cura"
license=('AGPL3')
depends=('bash'
         'python2' 
         'wxpython' 
         'python2-opengl' 
         'python2-pyserial' 
         'python2-numpy' 
         'python2-power-git')
provides=('cura')
conflicts=('cura' 
           'cura-bin' 
           'cura-git' 
           'cura-old' 
           'cura-not-so-old')

_aleph_ver_major=$(echo "$pkgver" | cut -d "." -f 1)
_aleph_url_root="http://download.lulzbot.com/Software/Cura/Packages/Cura_${_aleph_ver_major}"

if [ "$CARCH" == x86_64 ]; then
    source+=(${_aleph_url_root}/cura_${pkgver}-8bed_amd64.deb)
    sha1sums+=('458528f3e1ea5033d0a2efdc10c9108184791a15')
elif [ "$CARCH" == i686 ]; then
    source+=(${_aleph_url_root}/cura_${pkgver}-8bed_i386.deb)
    sha1sums+=('fd6ed10d0b4fea59129be2596c044021ca94c648')
fi

source+=(arch_aleph_patch.diff)
sha1sums+=('ba7a71da6f433e57e4cb67b9a295d4c249518b6e')

prepare()
{
    # Unpack the tarball containing the 'usr/' directory,
    # where all the essentials reside within the debian package
    tar zxf "${srcdir}/data.tar".gz -C "${srcdir}"

    # remove python-power since we have it in the deps:
    rm -rv "${srcdir}"/usr/share/cura/power/
    rm -rv "${srcdir}"/usr/share/cura/Cura/util/Power

    # Apply the patchset, which mainly changes any ambiguous references
    # to 'python' to 'python2' (as arch uses python3 by default)
    patch -d "${srcdir}" -p1 < ../arch_aleph_patch.diff
}

package()
{
    cp -r "${srcdir}"/usr "${pkgdir}"/usr
}
