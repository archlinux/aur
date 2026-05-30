# Maintainer: stef204 < base64 -d c3RlZjIwNEB5YW5kZXguY29tCg== >
# Contributor: brent s. <bts[at]square-r00t[dot]net>

# Note: Inline sed fixes will be converted to proper patch files
# when upstream releases 3.3.0 stable.

pkgname=mindi
pkgver=3.3.0
pkgrel=2
pkgdesc="Creates bootable media with your system for disaster recovery"
arch=('x86_64')
url="http://www.mondorescue.org/"
license=('GPL2')
backup=('etc/mindi/mindi.conf' 'etc/mindi/deplist.txt' 'etc/mindi/deplist.d/addon.conf')
depends=('bzip2' 'cdrkit' 'ncurses' 'binutils' 'gawk' 'dosfstools'
         'mindi-busybox' 'mondorescue-common' 'parted' 'perl' 'mtools'
         'which' 'grep' 'cpio' 'inetutils' 'xorriso' 'perl-module-scandeps')
source=("https://hub.darcs.net/stef204/mondorescue-aur/raw/mindi-${pkgver}.tar.gz"
        "https://hub.darcs.net/stef204/mondorescue-aur/raw/mindi-arch-detect.patch"
        "https://hub.darcs.net/stef204/mondorescue-aur/raw/mindi-arch-grub2.patch")
sha512sums=('5900c07e3e9cfc70c40109b015df303cea08af81f3e55bf30b9f2e9ca4fd55723fec2a1de6cfa90db1f89a069aa2324c22c8243ae44a81e66d1a7f210584b3e8'
            '6f6838617340ee8cc5977a604faf964b388ae5b22af4f8361f2144354128320833188bc80aade9242e315d3fbdb0a91dd82bcfb4dc09dca23430ff43834def5c'
            '52a3b17b6dc376e02fb977156cbd9ba5bbe6485afd6f4dcef34b67f0b852c695d4a3ae8d1a6abfb43c2338b0404be5ff65628e7540d1992969e7bf137b515d67')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  sed -i 's|/sbin|/usr/bin|g' install.sh
  sed -i 's|SBINDIR=$local/usr/bin|SBINDIR=$local/bin|' install.sh
  sed -i 's|subsbin=$sublocal/usr/bin|subsbin=$sublocal/bin|' install.sh
  sed -i 's|rootfs/usr/usr/bin|rootfs/usr/bin|g' install.sh
  sed -i 's|/usr/usr/bin|/usr/bin|g' install.sh
  
  sed -i 's|pod2man|#pod2man|' install.sh
  sed -i 's|^\([[:space:]]*\)install -m 644 \$s\.8|\1#install -m 644 $s.8|' install.sh
  sed -i 's|^install -m 644 mindi\.8|#install -m 644 mindi.8|' install.sh
  sed -i '/chmod 755.*rootfs\/usr\/sbin\/\*/d' install.sh
  sed -i '/chmod 755.*rootfs\/usr\/bin\/\*/d' install.sh
  
  sed -i '/^# Systemd/,/^$/d' deplist.d/udev.conf
  sed -i '/^# systemd needs dbus/,/^$/d' deplist.d/udev.conf
  
  sed -i 's/(U)EFI/\\(U\\)EFI/g' mindi
  sed -i 's/to \$efidir)\./to \$efidir\\)./g' mindi
  sed -i 's|`TryToFindKernelPath`|/boot/vmlinuz-linux|g' mindi
  
  patch -p1 -i "${srcdir}/mindi-arch-detect.patch"
  patch -p1 -i "${srcdir}/mindi-arch-grub2.patch"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p rootfs/usr/bin
  
  export DONT_RELINK=1
  export HEAD="${pkgdir}"
  export PREFIX=/usr
  export CONFDIR=/etc
  export DOCDIR=/usr/share/doc
  export LIBDIR=/usr/lib
  export CACHEDIR=/var/cache/mindi
  export PKGBUILDMINDI="true"

  ./install.sh
  find "${pkgdir}/usr/lib/mindi/rootfs" -type d -exec chmod 755 {} \;

  install -d "${pkgdir}/usr/share/doc/mindi"
  install -m644 ChangeLog AUTHORS COPYING README README.* TODO INSTALL NEWS \
    "${pkgdir}/usr/share/doc/mindi/" 2>/dev/null || true
}
