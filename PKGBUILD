# Maintainer: archledger <archledger236@gmail.com>
pkgname=irlume
pkgver=0.2.1
pkgrel=1
pkgdesc="Windows Hello-style face login for Linux"
arch=('x86_64')
url="https://github.com/archledger/irlume"
license=('GPL-3.0-or-later')
# Arch ships onnxruntime 1.24+ but SPLIT into onnxruntime-cpu / -cuda / -rocm,
# each Provides=onnxruntime. Depend on the virtual 'onnxruntime' so any variant
# the user has satisfies it (no conflict); a fresh install prompts to pick one —
# choose onnxruntime-cpu unless you want GPU execution providers.
depends=('onnxruntime' 'tpm2-tss' 'pam')
optdepends=('fprintd: fingerprint companion factor')
makedepends=('rust' 'cargo' 'gcc' 'git-lfs')
# Models ride in the tag via Git LFS. GitHub's auto-generated tag tarballs do
# NOT include LFS objects (they ship 131-byte pointer stubs) — that is exactly
# why this PKGBUILD clones the git tag and runs `git lfs pull` instead of using
# the tarball. Do not "simplify" to the archive URL.
source=("git+https://github.com/archledger/irlume.git#tag=v${pkgver}")
sha256sums=('SKIP')
install=irlume.install

prepare() {
    cd "$srcdir/$pkgname"
    git lfs install --local
    git config lfs.url https://github.com/archledger/irlume.git/info/lfs
    git lfs pull
}

build() {
    cd "$srcdir/$pkgname"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm0755 target/release/irlumed "$pkgdir/usr/bin/irlumed"
    install -Dm0755 target/release/irlume  "$pkgdir/usr/bin/irlume"
    install -Dm0644 target/release/libpam_irlume.so "$pkgdir/usr/lib/security/pam_irlume.so"
    for m in glintr100 face_detection_yunet_2023mar face_landmark blaze_face_short_range; do
        install -Dm0644 "models/$m.onnx" "$pkgdir/usr/share/irlume/models/$m.onnx"
    done
    install -Dm0644 packaging/systemd/irlumed.service "$pkgdir/usr/lib/systemd/system/irlumed.service"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
