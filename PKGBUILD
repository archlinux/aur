# Maintainer: Librewish <librewish@gail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: darkcoder <mario_vazq@hotmail.com>
pkgname=os-prober-btrfs
_pkgname=os-prober
pkgver=1.79
pkgrel=5
pkgdesc="Utility to detect other OSes on a set of drives (with additional patches to detect btrfs systems and other systems)"
url="http://joey.kitenet.net/code/os-prober/"
arch=('x86_64')
license=('GPL3')
depends=('sh')
provides=('os-prober' 'os-prober-garuda')
conflicts=('os-prober' 'os-prober-garuda')
replaces=('os-prober-garuda')
source=(http://http.debian.net/debian/pool/main/o/${_pkgname}/${_pkgname}_${pkgver}.tar.xz
    os-prober-frugalware.diff
	os-prober-mdraidfix.patch
	os-prober-btrfsfix.patch
	os-prober-bootpart-name-fix.patch
	os-prober-mounted-partitions-fix.patch
	os-prober-factor-out-logger.patch
	os-prober-factored-logger-efi-fix.patch
	os-prober-umount-fix.patch
	os-prober-grub2-parsefix.patch
	os-prober-grub2-multiple-images.patch
	os-prober-grepfix.patch
	os-prober-gentoo-fix.patch
	fix-blkid-path.patch
	grub-initrd-generation-fix
	grub-initrd-generation-fix.hook)
md5sums=('08d3bfff00f1f7c068ce509656728eba'
         '2ae284a2fc6cafb6ec4af0f44d3c3e48'
         'fa2c878cbb8af6b6dc57b6cd966520ec'
         'b71e32f69569f8ad693a19c7129cadf2'
         '672f301022bdb4a2962e9c7f8af05f21'
         '3c15707f9abbf2867d44886a77dbf74a'
         '7e4c8f98ff7763472bc46adb4f9119c2'
         '1a09f769d1e966c773b8885a9b0be44e'
         '69e5e23a35a2756fcb9d649d0ae2eea5'
         'b81bdf05173269ccce91c9a81ce4bfe8'
         '2ac73c1c9f3ff32c4c5670f5fbda9f0d'
         'ed3242f992b525a4af0a9df9af51e334'
         'ec05aaa35c83ab669291e8895c252cc8'
         '20dc42ef9b69f79b920380cd95191ed3'
         '11022b82f0640b62549f8f0ebdd73b9b'
         'a5cb186a987900d07f41eaa732407fbe')
sha256sums=('abe6317d078c4e51e322e62036b6df4a698bfe80c5be110a08894841179810ee'
            '9a6c22c91ea5955d665bc20d85d899f6721875a6216862d59a1b7f3f4241fd02'
            '092b0caef6fff45560531c0735e9449cb05a677e2296d72b5a0b4fb568fa4476'
            '0ebfd75cfc82cfba2d239986ad68213dc8ee92943a1c68111b34e3fefc360232'
            'c3d094f02b8a00026af10fdfe2ea9286cd1af6a1e25afcc82f3b234bdb64b86f'
            '7a9c4a0f5bba4053b1bbf1640c854aee83f526fd086c94bc7691e1d3cb28afb7'
            'b5c41ac1bc1a4544dd2d9efdcf190d6e5c2f0822b6d0e5fc8f7e6e5222da1d8d'
            '08bf632e4716a3a63bd8f20e729c540754b676b23f4f82ff9156c448910c6f94'
            '81a5ce0c5e784480dff7520bdfada8f80dfe96b101e14e41bca2d0992e863e68'
            'afc201d4d71525b73ffa365f7c667148e007836567be4c8ec25ea661d43b43f8'
            '07b919c7559ce6c5a8d8907d752366fc97ccf40b7ad54cbb2de904a9dd373efd'
            'a9331117892dd9876b346d941969f70da96d54ce122d7a5ff40d9efe36aded42'
            '02741e0edbc46327501be5d74977ff2bffa5ddaffe6a55a689e38ce4b8372444'
            '87bbb0f69ebb47f5136291d6851967fba791db4f27d8883b35fc5be1653ff7a6'
            'e9c734b0631c735f77b48ec57e765744971fce3f7f03eac204a78f21b79287cf'
            '7092754efb20ec9b748b1c678bcf50b6d4f55ac0d8f01520f319a5d337136a79')

prepare() {
  cd ${_pkgname}

  patch -p1 -i "$srcdir"/os-prober-frugalware.diff
  patch -p1 -i "$srcdir"/os-prober-mdraidfix.patch
  patch -p1 -i "$srcdir"/os-prober-btrfsfix.patch
  patch -p1 -i "$srcdir"/os-prober-bootpart-name-fix.patch
  patch -p1 -i "$srcdir"/os-prober-mounted-partitions-fix.patch
  patch -p1 -i "$srcdir"/os-prober-factor-out-logger.patch
  patch -p1 -i "$srcdir"/os-prober-factored-logger-efi-fix.patch
  patch -p1 -i "$srcdir"/os-prober-umount-fix.patch
  patch -p1 -i "$srcdir"/os-prober-grub2-parsefix.patch
  patch -p1 -i "$srcdir"/os-prober-grub2-multiple-images.patch
  patch -p1 -i "$srcdir"/os-prober-grepfix.patch
  patch -p1 -i "$srcdir"/os-prober-gentoo-fix.patch
  patch -p1 -i "$srcdir"/fix-blkid-path.patch

  # adjust lib dir to allow detection of 64-bit distros
  sed -i -e "s:/lib/ld\*\.so\*:/lib*/ld*.so*:g" os-probes/mounted/common/90linux-distro
  rm -f Makefile
}

build() {
  cd ${_pkgname}
  make newns
}

package() {
  cd "${srcdir}"

  install -Dm644 grub-initrd-generation-fix.hook $pkgdir/usr/share/libalpm/hooks/grub-initrd-generation-fix.hook
  install -Dm755 grub-initrd-generation-fix $pkgdir/usr/share/libalpm/scripts/grub-initrd-generation-fix

  cd "${_pkgname}"

  install -Dm 755 os-prober linux-boot-prober -t "${pkgdir}/usr/bin"
  install -Dm 755 newns -t "${pkgdir}/usr/lib/os-prober"
  install -Dm 755 common.sh -t "${pkgdir}/usr/share/os-prober"

  for dir in os-probes os-probes/mounted os-probes/init linux-boot-probes linux-boot-probes/mounted; do
    install -dm 755 "${pkgdir}/usr/lib/${dir}"
    install -m 755 -t "${pkgdir}/usr/lib/${dir}" "${dir}"/common/*
    [[ -d "${dir}"/x86 ]] && cp -r "${dir}"/x86/* "${pkgdir}/usr/lib/${dir}"
  done

  install -Dm 755 os-probes/mounted/powerpc/20macosx "${pkgdir}"/usr/lib/os-probes/mounted/20macosx
  install -dm 755 "${pkgdir}"/var/lib/os-prober
}
