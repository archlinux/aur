# Maintainer: Arthur Borsboom <arthurborsboom@gmail.com>
# Contributor: Shanmu Thiagaraja <sthiagaraja+AUR@prshanmu.com>
# Contributor: Limao Luo
# Contributor: Luceo
# Contributor: Revellion
# Contributor: John Thomson

#linux-4.7 EFI boot panic issue (patch linux)
#http://lkml.iu.edu/hypermail/linux/kernel/1608.2/03448.html

_build_stubdom=${build_stubdom:-false}
## use _build_stubdom=true to build xen with stubdom
#_build_stubdom=true

pkgname=xen
pkgver=4.7.0
pkgrel=3
pkgdesc="Virtual Machine Hypervisor & Tools"
arch=(x86_64)
url="http://www.xenproject.org/"
license=(GPL2)
depends=(bridge-utils curl gnutls iproute2 libaio libcap-ng libiscsi libnl libpng lzo2 pciutils python python2 sdl spice usbredir yajl
        # seabios ovmf qemu
        )
[[ "$CARCH" == "x86_64" ]] && depends+=(lib32-glibc)
makedepends=(bin86 cmake dev86 figlet git iasl markdown nasm ocaml-findlib spice-protocol wget)

## For building Xen EFI boot file.
## mingw-w64-binutils only needed if 
## binutils not built with --enable-targets=x86_64-pep 
_binutils_emulations=$(ld -V)
_binutils_efi=false
if [[ $_binutils_emulations == *'i386pep'* ]]
then
    _binutils_efi=true
    echo 'ld has efi support'
else
    makedepends+=(mingw-w64-binutils)
    echo 'ld does not have efi support, using mingw'
fi

optdepends=('xen-docs: Official Xen Documentation' 'openvswitch: Optional Networking support')
conflicts=(xen-4.2{,-testing-hg} xen-{gdbsx,hg-unstable,rc,git,igvtg} xen-4.3{,-testing-hg} xen-4.4 xen-4.5 xen-4.6)
backup=(
        etc/modules-load.d/$pkgname.conf
        etc/$pkgname/xl.conf
        etc/conf.d/xen{stored,consoled,domains,commons}
        etc/$pkgname/grub.conf
        )
options=(!buildflags !strip)
install=$pkgname.install
changelog=ChangeLog

##SeaBIOS & OVMF tags are in src/xen-*/tools/Config.mk
##grep -R 'UPSTREAM_REVISION' src/xen-*/Config.mk
_git_tag_seabios='#tag=rel-1.9.2'
_git_tag_ovmf='#tag=52a99493cce88a9d4ec8a02d7f1bd1a1001ce60d'

source=(
    http://bits.xensource.com/oss-xen/release/$pkgver/$pkgname-$pkgver.tar.gz
    http://xenbits.xen.org/xen-extfiles/ipxe-git-9a93db3f0947484e30e753bbd61a10b17336e20e.tar.gz

    'seabios'::"git://xenbits.xen.org/seabios.git${_git_tag_seabios}"
    'ovmf'::"git://xenbits.xen.org/ovmf.git${_git_tag_ovmf}"
    ##HTTP access
    #'seabios'::"git+http://xenbits.xen.org/git-http/seabios.git${_git_tag_seabios}"

    ## Compile patches
    ati-passthrough.patch
    ovmf.patch
    #patch-build-efi-with-mingw.patch::https://github.com/jakogut/xen-igvtg-aur/raw/28c81072e419d72a100ada9c393e37fae35ad263/xen_efi_build.patch
    patch-gcc6-ovmf-build.sh.patch
    #ipxe
    patch-gcc6-etherboot-nonnull-compare.patch::https://git.ipxe.org/ipxe.git/patch/e2f14c2f8c10674dbbd4f1228d79dc4c9be213b5
    patch-gcc6-etherboot-rm-unused-string-functions.patch
    patch-gcc6-etherboot-nic.c.patch::https://git.ipxe.org/ipxe.git/patch/a5885fbc19c4b60dc1a21624d1a9d1b77a93504e
    patch-gcc6-etherboot-ath.patch::https://git.ipxe.org/ipxe.git/patch/63037bdce4a325e5e1da85ffcdf27b77ac670c01
    patch-gcc6-etherboot-sis190.patch::https://git.ipxe.org/ipxe.git/patch/65b32a0b7000f70a5bb1d33190d40f9b04c93172
    patch-gcc6-etherboot-skge.patch::https://git.ipxe.org/ipxe.git/patch/76ec2a0540b25dbd183b9ce185583a4b24278cf1
    patch-gcc6-etherboot-via-velocity.c.patch
    patch-gcc6-etherboot-via-rhine.c.patch
    patch-gcc6-etherboot-e1000_phy.c.patch
    patch-gcc6-etherboot-igb_phy.c.patch
    patch-gcc6-etherboot-eth_broadcast.patch::https://git.ipxe.org/ipxe.git/patch/1cbb1581f16e235fafc963c906ad02b38d5457bd
    patch-gcc6-etherboot-link-header.patch::https://git.ipxe.org/ipxe.git/patch/6324bd9389521c7e86384591f41eb78a81e9af47
    patch-gcc6-etherboot-ath9k-9287-array.patch

    ## Files
    xen.install
    09_xen
    efi-xen.cfg
    grub.conf
    $pkgname.conf
    tmpfiles.d-$pkgname.conf

    ## XSA patches
    https://xenbits.xen.org/xsa/xsa182-unstable.patch
    https://xenbits.xen.org/xsa/xsa183-unstable.patch
    https://xenbits.xen.org/xsa/xsa184-qemut-master.patch
    https://xenbits.xen.org/xsa/xsa184-qemuu-master.patch
    https://xenbits.xen.org/xsa/xsa185.patch
    https://xenbits.xen.org/xsa/xsa186-0001-x86-emulate-Correct-boundary-interactions-of-emulate.patch
    https://xenbits.xen.org/xsa/xsa186-4.7-0002-hvm-fep-Allow-testing-of-instructions-crossing-the.patch
    https://xenbits.xen.org/xsa/xsa187-4.7-0001-x86-shadow-Avoid-overflowing-sh_ctxt-seg.patch
    https://xenbits.xen.org/xsa/xsa187-4.7-0002-x86-segment-Bounds-check-accesses-to-emulation-ctx.patch
    )

if [ "$_build_stubdom" = true ] ; then
    echo "building with stubdom"
    source+=(
        http://xenbits.xen.org/xen-extfiles/lwip-1.3.0.tar.gz
        http://xenbits.xen.org/xen-extfiles/zlib-1.2.3.tar.gz
        http://xenbits.xen.org/xen-extfiles/newlib-1.16.0.tar.gz
        http://xenbits.xen.org/xen-extfiles/pciutils-2.2.9.tar.bz2
        http://xenbits.xen.org/xen-extfiles/polarssl-1.1.4-gpl.tgz
        http://xenbits.xen.org/xen-extfiles/grub-0.97.tar.gz
        http://xenbits.xen.org/xen-extfiles/tpm_emulator-0.7.4.tar.gz
        http://xenbits.xen.org/xen-extfiles/gmp-4.3.2.tar.bz2
        #http://caml.inria.fr/pub/distrib/ocaml-3.11/ocaml-3.11.0.tar.gz
    )
fi


noextract=(
    ipxe-git-9a93db3f0947484e30e753bbd61a10b17336e20e.tar.gz
    )

if [ "$_build_stubdom" = true ] ; then
    noextract+=(
        lwip-1.3.0.tar.gz
        zlib-1.2.3.tar.gz
        newlib-1.16.0.tar.gz
        pciutils-2.2.9.tar.bz2
        polarssl-1.1.4-gpl.tgz
        grub-0.97.tar.gz
        tpm_emulator-0.7.4.tar.gz
        gmp-4.3.2.tar.bz2
        #ocaml-3.11.0.tar.gz
    )
fi

sha256sums=(
            'be5876144d49729572ae06142e0bb93f1c1f2695578141eff2931995add24623'
            '632ce8c193ccacc3012bd354bdb733a4be126f7c098e111930aa41dad537405c'

            'SKIP'
            'SKIP'

            'd93c2d5bcdf0c3e4c6e8efb357cb4b9d618209025361f5ccd9d03651a8acd7a3'
            '9cf9232c6e9a2b972cd4e1c7aacac9152bb8676db2b794381e1964c9f452e7de'
            #'a8ce42777e22af49080131e174b6b89c6e7597539838fb8b17a12280fd10b10b'
            '6403a0478e3cfed91dcad53b5f02e71745c98d18ab53930f87aeff1da8d71d55'
            #ipxe
            '17bb27d95c86af8cc5e499b1b0db9b95bba3f45910d55b420f9f1f5452355fab'
            '5d5fe7bf52cbae9da20cfd1fc798699b2355a1af907ebf7f764e227891a759bb'
            '9f34f8ecb9a44c688275b838c83efd233bb817f5e222629eac98e116168d704c'
            'cdf7c4a089fe1fe493aafaf669decc3c9e071a0950da77dce526c09088d1c931'
            '32595581467772b9fa0fbb5384c99caefeb2cee3306b94b9bd2722084454f5a2'
            'c73d1653b9b1d97ddce717817dc74429cd94c7b22989a08604eaa60df63f75f8'
            '448caed900ada2c030738218f5b82f5e29d9dc2e1beef9ebd49cbeb23734df0d'
            '61b1518c8d41792ec3b36e0fbfc265adb6c9304945a6fa18d6cc5a197e34b94f'
            '577f06e38a9ecbd3576907f2ba1c5040f4f1573fe92912635230702ad157b2e7'
            '80a24e9504d3893e83dc60550ffe364a873aaf3dafb52dcdade13f61f2ec0ee5'
            'be05ccd8975af402dcba3a3dc78c173319b2edd636bac11ac11163091453b704'
            'cace870b6629003b55d9df9ef24f3445067239b913c006b6e23da511c1a21d78'
            'a15d73e0fb51fe3c1cf8b80a5ff17d532444016d14495d90d9e642ec60f320a6'
            #pkgbuild files
            'c3b5b199c3ed271267d255f34e116258c593d04727ff1fd9199ecd37c1b98fe8'
            '06c9f6140f7ef4ccfc4b1a7d9732a673313e269733180f53afcd9e43bf6c26bb'
            'ceaff798a92a7aef1465a0a0b27b1817aedd2c857332b456aaa6dd78dc72438f'
            '3f0af16958c3e057b9baa5afc47050d9adf7dd553274dd97ae4f35938fefb568'
            '50a9b7fd19e8beb1dea09755f07318f36be0b7ec53d3c9e74f3266a63e682c0c'
            '40e0760810a49f925f2ae9f986940b40eba477dc6d3e83a78baaae096513b3cf'

            ## XSA patches
            '303400b9a832a3c1d423cc2cc97c2f00482793722f9ef7dd246783a049ac2792'
            'ea0ea4b294332814330f222e6d78eea3b19c394eac8ae22feb4a5bd21e90331f'
            'ea41a25dac82cc5c0ef8e599feb6ed400e99414110d4dba8017d6bd048bc3de4'
            '2d675e5e08d9443cf2e5f3aa37521241d6ed898a602b5111d6969023e67b9b6b'
            '3328a1953ecdf4de35462ea8396b0927171d718e95f73a87a7f651427bd8f8b4'
            'f2082a36d968a47e477bb5082d0e0aaa58e6cb3dc20b26389f043a9b7b595fa6'
            '5a826a32763d82ac83c924f8c89d12aae5f069a4cbc7d5193aa8413a02b6dc05'
            'be9fe85d36c2c1fbca246c1f4d834c3ef11b6ab3d5467da0ac8c079aa5a68de9'
            '36b22d6a168be39f31a1c1304f708269a2a10fe5105f7da4a06877d6059f1cd6'
	    )


if [ "$_build_stubdom" = true ] ; then
    sha256sums+=(
            #stubdom bits
            '772e4d550e07826665ed0528c071dd5404ef7dbe1825a38c8adbc2a00bca948f'
            '1795c7d067a43174113fdf03447532f373e1c6c57c08d61d9e4e9be5e244b05e'
            'db426394965c48c1d29023e1cc6d965ea6b9a9035d8a849be2750ca4659a3d07'
            'f60ae61cfbd5da1d849d0beaa21f593c38dac9359f0b3ddc612f447408265b24'
            '2d29fd04a0d0ba29dae6bd29fb418944c08d3916665dcca74afb297ef37584b6'
            '4e1d15d12dbd3e9208111d6b806ad5a9857ca8850c47877d36575b904559260b'
            '4e48ea0d83dd9441cc1af04ab18cd6c961b9fa54d5cbf2c2feee038988dea459'
            '936162c0312886c21581002b79932829aa048cfaf9937c6265aeaa14f1cd1775'
            #'ecdd4f8473ab0dee5d3acb5c0a31a4c1dd6aa12179895cf1903dd0f455c43a4f'

            #stubdom patches
            )
fi

prepare() {
    cd "$pkgname-$pkgver/"

    ### Copy git sourced tools/firmware
    # Copy seabios into place
    mkdir tools/firmware/seabios-dir-remote/
    cp -r ../seabios/* tools/firmware/seabios-dir-remote/
    # Copy ovmf into place
    mkdir tools/firmware/ovmf-dir-remote/
    cp -r ../ovmf/* tools/firmware/ovmf-dir-remote/

    ### Patching

    # XSA Patches
    echo 'XSA patches'
    # Security Patches - Base
    patch -Np1 -i "$srcdir/xsa182-unstable.patch"
    patch -Np1 -i "$srcdir/xsa183-unstable.patch"
    patch -Np1 -i "$srcdir/xsa185.patch"
    patch -Np1 -i "$srcdir/xsa186-0001-x86-emulate-Correct-boundary-interactions-of-emulate.patch"
    patch -Np1 -i "$srcdir/xsa186-4.7-0002-hvm-fep-Allow-testing-of-instructions-crossing-the.patch"
    patch -Np1 -i "$srcdir/xsa187-4.7-0001-x86-shadow-Avoid-overflowing-sh_ctxt-seg.patch"
    patch -Np1 -i "$srcdir/xsa187-4.7-0002-x86-segment-Bounds-check-accesses-to-emulation-ctx.patch"

    # Security Patches - qemu-xen-traditional
    cd 'tools/qemu-xen-traditional/'
    patch -Np1 -i "$srcdir/xsa184-qemut-master.patch"
    cd '../../'

    # Security Patches - qemu-xen (upstream)
    cd 'tools/qemu-xen/'
    patch -Np1 -i "$srcdir/xsa184-qemuu-master.patch"
    cd '../../'


    # Compile Patches
    echo 'Compile patches'

    # Build EFI binary with mingw
    if [ $_binutils_efi != true ]
    then
        #patch -Np1 -i "$srcdir/patch-build-efi-with-mingw.patch"
        sed -i.bak '/ EFI_LD/s/LD/LD_EFI/' xen/arch/x86/Makefile
        sed -i.bak 's/LD/LD_EFI/' xen/arch/x86/efi/Makefile
        sed -i.bak '/EFI_MOUNTPOINT .*/aLD_EFI ?= $(LD)' xen/Makefile
    fi

    # OVMF Compile support (Pulls from GIT repo, so patching to patch after pull request)
    patch -Np1 -i "$srcdir/ovmf.patch"
    cp "$srcdir/patch-gcc6-ovmf-build.sh.patch" tools/firmware/

    # Uncomment line below if you want to enable ATI Passthrough support (some reported successes, untested with 4.4)
    #patch -Np1 -i "$srcdir/ati-passthrough.patch"

    ## GCC-6
    #etherboot
    echo -e "patch-gcc6-etherboot-nonnull-compare.patch\npatch-gcc6-etherboot-rm-unused-string-functions.patch\npatch-gcc6-etherboot-nic.c.patch\npatch-gcc6-etherboot-ath.patch\npatch-gcc6-etherboot-sis190.patch\npatch-gcc6-etherboot-skge.patch\npatch-gcc6-etherboot-via-velocity.c.patch\npatch-gcc6-etherboot-via-rhine.c.patch\npatch-gcc6-etherboot-e1000_phy.c.patch\npatch-gcc6-etherboot-igb_phy.c.patch\npatch-gcc6-etherboot-link-header.patch\npatch-gcc6-etherboot-eth_broadcast.patch\npatch-gcc6-etherboot-ath9k-9287-array.patch" >> tools/firmware/etherboot/patches/series
    cp ${srcdir}/patch-gcc6-etherboot-*.patch tools/firmware/etherboot/patches/

    ## Fix Install Paths
    sed -i 's:\$localstatedir/run/xen:/run/xen:' m4/paths.m4
    sed -i 's:/var/run:/run:' tools/ocaml/xenstored/define.ml
    sed -i 's:/var/run:/run:' tools/ocaml/xenstored/systemd_stubs.c

    if [ "$_build_stubdom" = true ] ; then
        # Copy supporting tarballs into place
        cp "$srcdir/lwip-1.3.0.tar.gz" stubdom/
        cp "$srcdir/zlib-1.2.3.tar.gz" stubdom/
        cp "$srcdir/newlib-1.16.0.tar.gz" stubdom/
        cp "$srcdir/pciutils-2.2.9.tar.bz2" stubdom/
        cp "$srcdir/polarssl-1.1.4-gpl.tgz" stubdom/
        cp "$srcdir/grub-0.97.tar.gz" stubdom/
        cp "$srcdir/tpm_emulator-0.7.4.tar.gz" stubdom/
        cp "$srcdir/gmp-4.3.2.tar.bz2" stubdom/
        #cp "$srcdir/ocaml-3.11.0.tar.gz" stubdom/

        ## Stubdom patches
        cd 'extras/mini-os'
        cd '../../'

    fi

    #etherboot
    cp "$srcdir/ipxe-git-9a93db3f0947484e30e753bbd61a10b17336e20e.tar.gz" tools/firmware/etherboot/ipxe.tar.gz

    #Workaround for cannot compute sizeof (unsigned short) 
    #Makefile:170: recipe for target 'gmp-x86_64' failed
    #Probably not safe!
    #sed -i.bak "/< gmp.patch/a\	sed -i.bak 's/\\\\(\\\\s*\\\\)\\\\(fprintf (f,\\\\)\\\\(.*\\\\)/\\\\1\\\\2\\\\3\\\\n\\\\1clearerr(f);/' \$@/configure" stubdom/Makefile


}

build() {
    cd "$pkgname-$pkgver/"
    export LD_EFI="/usr/x86_64-w64-mingw32/bin/ld"
    ./autogen.sh
    if [ "$_build_stubdom" = true ] ; then
        _config_stubdom='--enable-stubdom'
    fi
    ./configure PYTHON=/usr/bin/python2 --prefix=/usr --sbindir=/usr/bin --with-sysconfig-leaf-dir=conf.d --with-initddir=/etc/init.d \
        --enable-systemd --disable-docs --enable-ovmf \
        "${_config_stubdom:---disable-stubdom}" \
        --with-extra-qemuu-configure-args="--disable-bluez --disable-gtk --enable-spice --enable-usb-redir"
        #--with-system-qemu --with-system-seabios --with-system-ovmf 
        #defaults --enable-qemu-traditional --enable-rombios \
    make LANG=C PYTHON=python2 dist-misc
    make LANG=C PYTHON=python2 dist-xen
    make LANG=C PYTHON=python2 dist-tools
    if [ "$_build_stubdom" = true ] ; then
        make LANG=C PYTHON=python2 dist-stubdom
    fi
}

package() {
    cd "$pkgname-$pkgver/"

    make DESTDIR="$pkgdir" LANG=C PYTHON=python2 install

    cd "$pkgdir"

    # Install files from AUR package
    install -Dm644 "$srcdir/tmpfiles.d-$pkgname.conf" usr/lib/tmpfiles.d/$pkgname.conf
    install -Dm644 "$srcdir/grub.conf" etc/xen/grub.conf
    install -Dm755 "$srcdir/09_xen" etc/grub.d/09_xen
    install -Dm644 "$srcdir/efi-xen.cfg" etc/xen/efi-xen.cfg

    # Fix paths in scripts, move to right locations and create missing directories
    sed -i 's:/var/run:/run:' etc/init.d/xencommons
    sed -i 's:/var/lock:/run/lock:' etc/xen/scripts/hotplugpath.sh
    sed -i 's:/var/run:/run:' etc/xen/scripts/locking.sh
    sed -i 's:/var/run:/run:' usr/lib/systemd/system/xenstored.service
    sed -i 's:/var/run:/run:' usr/lib/systemd/system/xenstored.socket
    sed -i 's:/var/run:/run:' usr/lib/systemd/system/xenstored_ro.socket

    mkdir var/log/xen/console

    # Sanitize library path (if lib64 exists)
    if [[ -d usr/lib64 ]]; then
        cd usr/
        cp -r lib64/* lib/
        rm -rf lib64
        cd ../
    fi

    # If EFI binaries build, move to /boot
    if [[ -f usr/lib/efi/xen.efi ]]; then
        mv usr/lib/efi/xen-$pkgver.efi boot/xen-$pkgver.efi
        rm -rf usr/lib/efi
    fi

    # Compress syms file and move to a share location
    #gzip boot/$pkgname-syms-*
    #mv boot/$pkgname-syms-*.gz usr/share/xen

    ##### Kill unwanted stuff #####
    # hypervisor symlinks
    rm -f boot/xen{,-4,-4.7,-4.7-rc}.gz

    # Documentation cleanup ( see xen-docs package )
    rm -rf usr/share/doc
    rm -rf usr/share/man

    # Unnecessary qemu support files
#    rm -rf usr/bin/qemu-*-xen
    rm usr/share/qemu-xen/qemu/{palcode,openbios}-*
    rm usr/share/xen/qemu/openbios-*

    # adhere to Static Library Packaging Guidelines
    rm -rf usr/lib/*.a

}
