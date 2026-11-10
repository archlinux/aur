# Experimental kernel module and firmware package for local validation.
# Place the reviewed vendor archive beside this recipe before building.
pkgname=mtgpu-s30-dkms
pkgver=3.1.0
pkgrel=3
pkgdesc='Moore Threads MTT S30 kernel module and firmware (Linux 7.x+ DKMS port)'
arch=('x86_64')
install='mtgpu-s30-dkms.install'
url='https://github.com/cont1nu1ty/mtt-s30-arch'
license=('GPL-2.0-only' 'MIT' 'LicenseRef-MooreThreads')
depends=('dkms')
makedepends=('python' 'libarchive' 'patch')
conflicts=('mtgpu-dkms')
options=('!strip' '!debug')
source=("musa_3.1.0-pc_x86.deb::https://github.com/cont1nu1ty/mtt-s30-arch/releases/download/v3.1.0/musa_3.1.0-pc_x86.deb" 'linux-modern.patch' 'prepare.py')
noextract=("musa_3.1.0-pc_x86.deb")
sha256sums=('04c286ba452fe0cfbea2c47465f0c48b0659c09b896f05f363feba680dd8efda'
            'ad17c7e782da149058ea35ea00e89f2933c8125636725b0d8fb264dba5eb46f0' '7ec612a122421c23c34f1efe7a25e16edf75298528b0a176a8d41e15329f9a9f')
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
    install -Dm644 "$srcdir/vendor-assets/usr/local/share/musa/License.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/License.txt"
}
