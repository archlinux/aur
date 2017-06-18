# Maintainer: Chris Hobbs (RX14) <chris@rx14.co.uk>
pkgname=infinitsh
pkgver=0.8.0
pkgrel=1
pkgdesc="Decentralized Software-Based File Storage Platform"
arch=('x86_64')
url="http://infinit.sh"
license=('unknown')
depends=('fuse')
source=("https://storage.googleapis.com/sh_infinit_releases/linux64/Infinit-x86_64-linux_debian_oldstable-gcc4-${pkgver}.tbz")
sha256sums=('9fabce2c42c9abadb4921c79d4b29369ed876c21a1ac090aa7780712b2399b8d')

_infinit_subcommands=(acl block credentials daemon device doctor drive journal ldap network passport storage user volume)

package() {
    # Unpack package contents to /opt/infinit
    mkdir -p $pkgdir/opt/infinit/
    cp -a "Infinit-x86_64-linux_debian_oldstable-gcc4-${pkgver}"/* $pkgdir/opt/infinit/

    # Fixup /opt/infinit/bin deprecated commands
    # TODO: check that this bug still exists next release
    rm -Rf $pkgdir/opt/infinit/bin/infinit-*
    for subcommand in "${_infinit_subcommands[@]}"; do
        ln -s infinit $pkgdir/opt/infinit/bin/infinit-$subcommand
    done

    # Add links to /opt/infinit/bin in /usr/bin
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/infinit/bin/infinit $pkgdir/usr/bin/infinit
    for subcommand in "${_infinit_subcommands[@]}"; do
        ln -s /usr/bin/infinit $pkgdir/usr/bin/infinit-$subcommand
    done

    # Move licenses to /usr/share
    mkdir $pkgdir/usr/share
    mv $pkgdir/opt/infinit/share/infinit $pkgdir/usr/share/infinit
}
