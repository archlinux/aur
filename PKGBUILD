# Maintainer: Kristian Gunstone <kristian.gunstone.butnotthispart@pean.northis.org>
# Contributor: Jan-Tarek Butt <tarek@ring0.de>
# This PKGBUILD is based on the 'cura-old' PKGBUILD maintained by Jan-Tarek.
# A specific version of CuraEngine is bundled with Aleph's Cura, and so it also
# comes with this package.
pkgname=cura-aleph-bin
pkgver=19.12
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

_aleph_url_root="http://download.lulzbot.com/Software/Cura/Packages/Cura_${pkgver}"
_aleph_signature="00054" # Version-specific signature; part of the filename

# Sha1sums verified against:
# http://download.alephobjects.com/ao/aodeb/dists/jessie/main/binary-amd64/Packages
# http://download.alephobjects.com/ao/aodeb/dists/jessie/main/binary-i386/Packages

if [ "$CARCH" == x86_64 ]; then
    source+=(${_aleph_url_root}/cura_${pkgver}-${_aleph_signature}_amd64.deb)
    sha1sums+=('ecf8f1f88b32c7ecda36b46222071241f27fe98f')
elif [ "$CARCH" == i686 ]; then
    source+=(${_aleph_url_root}/cura_${pkgver}-${_aleph_signature}_i386.deb)
    sha1sums+=('c2a84cff52815bffa7404f37717aacaae0202c5b')
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
