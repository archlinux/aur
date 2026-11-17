# Experimental kernel module and firmware package for local validation.
# Place the reviewed vendor archive beside this recipe before building.
pkgname=mtgpu-s30-dkms
pkgver=3.1.0
pkgrel=6
pkgdesc='Moore Threads MTT S30 kernel module and firmware (Linux 7.x+ DKMS port)'
arch=('x86_64')
install='mtgpu-s30-dkms.install'
url='https://github.com/cont1nu1ty/mtt-s30-arch'
license=('GPL-2.0-only' 'MIT' 'LicenseRef-MooreThreads')
depends=('dkms')
makedepends=('python' 'libarchive' 'patch')
conflicts=('mtgpu-dkms')
options=('!strip' '!debug')
source=(
    "musa_3.1.0-pc_x86.deb::https://github.com/cont1nu1ty/mtt-s30-arch/releases/download/v3.1.0/musa_3.1.0-pc_x86.deb"
    'linux-modern.patch'
    'prepare.py'
    '10-mtgpu-s30-dracut.conf'
    '10-mtgpu-watchdog.conf'
    'mtgpu-modprobe-guard'
    'mtgpu-boot-confirm'
    'mtgpu-boot-confirm.service'
    'mtgpu-dkms-check'
    '95-mtgpu-dkms-check.hook'
)
noextract=("musa_3.1.0-pc_x86.deb")
sha256sums=('04c286ba452fe0cfbea2c47465f0c48b0659c09b896f05f363feba680dd8efda'
            'd7b92635763bf23f53ebfcfb35a52924ba11b90f45cacdf5131af1d537c2ee55'
            '7ec612a122421c23c34f1efe7a25e16edf75298528b0a176a8d41e15329f9a9f'
            '9a8cdb9d8f7337ff929c751466fb60c0f1195230c826310f9fdda5e091858430'
            'da086117751aa39c9cff0fefb7f4e1c5348a25ead5b2ec4a8d3a328026b3ddc4'
            '440cf2a58b119c83394dfcaca9646227556d34bfbb74a07b1b530002f76a7698'
            'addaf9fa47b148f984bcd9488626dcc014c1f2ff02d7c6ccc218107723d2640c'
            'd35faf3eb2634ee5bbb97ccaa2c2578f2f7df342740745163b9b5f65e4eb6e29'
            '1fb0cddd215e20a28f3de960c42e4f3ce68da627943b3fd1cc47d7437d4b4600'
            'f4b2ce8f0adf14033a69a858fa77ab35b77065694271906bb8bd4fa204ed2e3d')

prepare() {
    # makepkg symlinks local sources; prepare.py resolves its own directory.
    # Keep a real script copy beside the patch directory it expects.
    mkdir -p "$srcdir/maintenance/patches"
    cp -L "$srcdir/prepare.py" "$srcdir/maintenance/prepare.py"
    cp "$srcdir/linux-modern.patch" "$srcdir/maintenance/patches/linux-modern.patch"
    rm -rf "$srcdir/patched" "$srcdir/vendor-assets"
    python3 "$srcdir/maintenance/prepare.py" --deb "$srcdir/musa_3.1.0-pc_x86.deb" --output "$srcdir/patched"
    mkdir "$srcdir/vendor-assets"
    bsdtar -xOf "$srcdir/musa_3.1.0-pc_x86.deb" data.tar.xz |
        bsdtar -xf - -C "$srcdir/vendor-assets" ./lib/firmware/mthreads ./usr/local/share/musa/License.txt
}

package() {
    local target="$pkgdir/usr/src/mtgpu-s30-$pkgver"
    install -d "$target"
    cp -r "$srcdir/patched/." "$target/"
    rm -f "$target"/dkms.pre_install "$target"/dkms.post_install "$target"/dkms.post_remove "$target"/mtgpu_hook
    # Generated for DKMS only; vendor post-install hooks alter Debian initramfs.
    cat > "$target/dkms.conf" <<'EOF'
PACKAGE_NAME="mtgpu-s30"
PACKAGE_VERSION="3.1.0"
BUILT_MODULE_NAME[0]="mtgpu"
DEST_MODULE_LOCATION[0]="/updates/dkms"
MAKE[0]="make ARCH=x86_64 KERNELVER=$kernelver KERNELDIR=$kernel_source_dir"
AUTOINSTALL="yes"
EOF
    install -d "$pkgdir/usr/lib/firmware/mthreads"
    install -m644 "$srcdir/vendor-assets/lib/firmware/mthreads/"* "$pkgdir/usr/lib/firmware/mthreads/"

    # Safe-boot resilience: initramfs exclusion, modprobe watchdog, boot verifier, and pacman DKMS check
    install -Dm644 "$srcdir/10-mtgpu-s30-dracut.conf" "$pkgdir/etc/dracut.conf.d/10-mtgpu-s30.conf"
    install -Dm644 "$srcdir/10-mtgpu-watchdog.conf" "$pkgdir/usr/lib/modprobe.d/10-mtgpu-watchdog.conf"
    install -Dm755 "$srcdir/mtgpu-modprobe-guard" "$pkgdir/usr/lib/mtgpu/mtgpu-modprobe-guard"
    install -Dm755 "$srcdir/mtgpu-boot-confirm" "$pkgdir/usr/lib/mtgpu/mtgpu-boot-confirm"
    install -Dm644 "$srcdir/mtgpu-boot-confirm.service" "$pkgdir/usr/lib/systemd/system/mtgpu-boot-confirm.service"
    install -d "$pkgdir/usr/lib/systemd/system/multi-user.target.wants"
    ln -s ../mtgpu-boot-confirm.service \
        "$pkgdir/usr/lib/systemd/system/multi-user.target.wants/mtgpu-boot-confirm.service"
    install -d "$pkgdir/var/lib/mtgpu"
    install -Dm755 "$srcdir/mtgpu-dkms-check" "$pkgdir/usr/lib/mtgpu/mtgpu-dkms-check"
    install -Dm644 "$srcdir/95-mtgpu-dkms-check.hook" "$pkgdir/usr/share/libalpm/hooks/95-mtgpu-dkms-check.hook"

    install -Dm644 "$srcdir/vendor-assets/usr/local/share/musa/License.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/License.txt"
}
