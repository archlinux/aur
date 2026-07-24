# Maintainer: archledger <archledger236@gmail.com>
pkgname=irlume
pkgver=0.6.1
pkgrel=1
pkgdesc="Windows Hello-style face login for Linux"
arch=('x86_64')
url="https://github.com/archledger/irlume"
license=('GPL-3.0-or-later')
# Arch ships onnxruntime 1.24+ but SPLIT into onnxruntime-cpu / -cuda / -rocm,
# each Provides=onnxruntime. Depend on the virtual 'onnxruntime' so any variant
# the user has satisfies it (no conflict); a fresh install prompts to pick one,
# choose onnxruntime-cpu unless you want GPU execution providers.
depends=('onnxruntime' 'tpm2-tss' 'pam')
optdepends=('fprintd: fingerprint companion factor')
# clang: v4l2-sys-mit generates its V4L2 bindings with bindgen, which needs
# libclang at build time; without it makepkg fails on a clean system.
makedepends=('rust' 'cargo' 'gcc' 'clang')
# The code comes from the signed git tag. The ONNX model weights are NOT in the
# tag; they are hosted as release assets on the version-independent `models-v1`
# release (kept out of Git LFS so builds do not consume the account's LFS
# bandwidth quota). makepkg downloads and checksum-verifies them as extra
# sources here, and prepare() stages them into the build tree.
source=("git+https://github.com/archledger/irlume.git#tag=v${pkgver}"
        "glintr100.onnx::https://github.com/archledger/irlume/releases/download/models-v1/glintr100.onnx"
        "face_detection_yunet_2023mar.onnx::https://github.com/archledger/irlume/releases/download/models-v1/face_detection_yunet_2023mar.onnx"
        "face_landmark.onnx::https://github.com/archledger/irlume/releases/download/models-v1/face_landmark.onnx"
        "blaze_face_short_range.onnx::https://github.com/archledger/irlume/releases/download/models-v1/blaze_face_short_range.onnx")
sha256sums=('SKIP'
            'a7933ea5330113b01c9b60351d8f4c33003f145d8470ac5f0e52ee2effe25c60'
            '8f2383e4dd3cfbb4553ea8718107fc0423210dc964f9f4280604804ed2552fa4'
            '821683be088447839638f79d64268bd501bdb72e5d9e262ec981c7e252956caf'
            'c5453678015f6289c1d77bda88a8ba9c87574f01de1a05ba1909b9a7e08b237b')
install=irlume.install

prepare() {
    cd "$srcdir/$pkgname"
    # Stage the release-hosted weights (makepkg already downloaded and verified
    # them from the sources above) into the tree the build expects.
    mkdir -p models
    cp "$srcdir"/glintr100.onnx "$srcdir"/face_detection_yunet_2023mar.onnx \
       "$srcdir"/face_landmark.onnx "$srcdir"/blaze_face_short_range.onnx models/
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
    # Self-heal: re-applies irlume's greeter PAM lines if a distro update strips
    # them. No-op until `irlume login enable` writes its marker.
    install -Dm0644 packaging/systemd/irlume-reconcile.path "$pkgdir/usr/lib/systemd/system/irlume-reconcile.path"
    install -Dm0644 packaging/systemd/irlume-reconcile.service "$pkgdir/usr/lib/systemd/system/irlume-reconcile.service"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
