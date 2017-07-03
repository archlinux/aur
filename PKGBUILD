# Maintainer: Kristian Gunstone <kristian.gunstone.butnotthispart@pean.northis.org>
# Contributor: Jan-Tarek Butt <tarek@ring0.de>
# This PKGBUILD is based on the 'cura-old' PKGBUILD maintained by Jan-Tarek.
# A specific version of CuraEngine is bundled with Aleph's Cura, and so it also
# comes with this package.
pkgname=cura-aleph-bin
pkgver=21.06
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

# This uncommented line shows the previously used upstream URL.
# It seems the two pages are currently not in sync, with the alephobjects.com
# being a bit ahead of the curve..
#_aleph_url_root="http://download.lulzbot.com/Software/Cura/Packages/Cura_${pkgver}"
_aleph_url_root="http://download.alephobjects.com/ao/aodeb/dists/jessie/main/binary-amd64"
_aleph_signature="f73e" # Version-specific signature; part of the filename

# Sha1sums verified against:
# http://download.alephobjects.com/ao/aodeb/dists/jessie/main/binary-amd64/Packages
# http://download.alephobjects.com/ao/aodeb/dists/jessie/main/binary-i386/Packages

if [ "$CARCH" == x86_64 ]; then
    source+=(${_aleph_url_root}/cura_${pkgver}-${_aleph_signature}_amd64.deb)
    sha1sums+=('085c8f18415d0f1a557ff5905bd1984013386632')
elif [ "$CARCH" == i686 ]; then
    source+=(${_aleph_url_root}/cura_${pkgver}-${_aleph_signature}_i386.deb)
    sha1sums+=('46fef86a1da902880807fbe4c334d23dcadf98c9')
fi

source+=(arch_aleph_patch.diff)
sha1sums+=('a6010f8e88b7d02900b5a2eb7f9f9fa2c50f7d57')

check()
{
    echo -e "
*****************************************************************************
In order for Cura to communicate with your printer, it needs to run from a
user which can both read and write to it. On Archlinux, this currently means
that you need to be in the ** uucp ** group.

To check and make sure, connect the printer and see who has access to it; e.g
$ ls -l /dev/ttyACM0
*****************************************************************************
"
}

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
    # Look for the patch both in
    #  ./ (i.e srcdir) and ../ (i.e same directory as where PKGFILE lies)
    # (see git log and https://aur.archlinux.org/packages/cura-aleph-bin/)
    patch -d "${srcdir}" -p1 < ../arch_aleph_patch.diff \
        || patch -d "${srcdir}" -p1 < arch_aleph_patch.diff 
}

package()
{
    cp -r "${srcdir}"/usr "${pkgdir}"/usr
}
