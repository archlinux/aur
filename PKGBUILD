# Maintainer: archledger <archledger236@gmail.com>
pkgname=irlume
pkgver=0.10.0
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
        "blaze_face_short_range.onnx::https://github.com/archledger/irlume/releases/download/models-v1/blaze_face_short_range.onnx"
        "face_landmarks_detector.tflite::https://github.com/archledger/irlume/releases/download/models-v1/face_landmarks_detector.tflite"
        # TFLite C runtime (#295): no current Arch/AUR system package exists
        # (AUR libtensorflow-lite is 2.4-era), so the pinned irlume-built
        # artifact bundles at the daemon resolver's first probed path.
        "libtensorflowlite_c-v2.19.0-linux-x64.tar.gz::https://github.com/archledger/irlume/releases/download/tflite-runtime-v2.19.0/libtensorflowlite_c-v2.19.0-linux-x64.tar.gz")
sha256sums=('SKIP'
            'a7933ea5330113b01c9b60351d8f4c33003f145d8470ac5f0e52ee2effe25c60'
            '8f2383e4dd3cfbb4553ea8718107fc0423210dc964f9f4280604804ed2552fa4'
            '821683be088447839638f79d64268bd501bdb72e5d9e262ec981c7e252956caf'
            'c5453678015f6289c1d77bda88a8ba9c87574f01de1a05ba1909b9a7e08b237b'
            'c7d54204ce0448474c7f3fa9af494787c0965cbdd6f20fc72867e43046bd43d5'
            'dd3abcdbc0f35a9466a682358955ac3826a9a81590cd6b8abcf98548e17bd311')
install=irlume.install

prepare() {
    cd "$srcdir/$pkgname"
    # Stage the release-hosted weights (makepkg already downloaded and verified
    # them from the sources above) into the tree the build expects.
    mkdir -p models
    cp "$srcdir"/glintr100.onnx "$srcdir"/face_detection_yunet_2023mar.onnx \
       "$srcdir"/face_landmark.onnx "$srcdir"/blaze_face_short_range.onnx \
       "$srcdir"/face_landmarks_detector.tflite models/
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
    # KDE wallet handoff helper. Not in /usr/bin: it is not a command a user
    # runs, it takes a secret on stdin, and it is only meaningful inside a PAM
    # transaction.
    install -Dm0755 target/release/irlume-kwallet-init "$pkgdir/usr/libexec/irlume/irlume-kwallet-init"
    install -Dm0755 target/release/irlume-gkr-unlock "$pkgdir/usr/libexec/irlume/irlume-gkr-unlock"
    # One line per model, deliberately not a loop over basenames. The loop that
    # used to be here was keyed on ".onnx", so the mesh model could not join it
    # and was simply forgotten: the unit pointed IRLUME_MESH_MODEL at a file
    # this package never shipped (#360). Being absent is silent, because
    # Engine::with_mesh treats a missing path as a no-op and returns Ok, so the
    # daemon starts and passive liveness, the closure gesture and the BlazeFace
    # rescue just stop working. Spelled out, each model is one line to add and
    # check-packaging-parity.sh can see every name.
    install -Dm0644 models/glintr100.onnx \
        "$pkgdir/usr/share/irlume/models/glintr100.onnx"
    install -Dm0644 models/face_detection_yunet_2023mar.onnx \
        "$pkgdir/usr/share/irlume/models/face_detection_yunet_2023mar.onnx"
    install -Dm0644 models/face_landmark.onnx \
        "$pkgdir/usr/share/irlume/models/face_landmark.onnx"
    install -Dm0644 models/blaze_face_short_range.onnx \
        "$pkgdir/usr/share/irlume/models/blaze_face_short_range.onnx"
    install -Dm0644 models/face_landmarks_detector.tflite \
        "$pkgdir/usr/share/irlume/models/face_landmarks_detector.tflite"
    install -Dm0755 "$srcdir/libtensorflowlite_c-v2.19.0-linux-x64/lib/libtensorflowlite_c.so" \
        "$pkgdir/usr/share/irlume/tflite/libtensorflowlite_c.so"
    install -Dm0644 "$srcdir/libtensorflowlite_c-v2.19.0-linux-x64/LICENSE.tensorflow" \
        "$pkgdir/usr/share/irlume/tflite/LICENSE.tensorflow"
    install -Dm0644 "$srcdir/libtensorflowlite_c-v2.19.0-linux-x64/PROVENANCE" \
        "$pkgdir/usr/share/irlume/tflite/PROVENANCE"
    install -Dm0644 "$srcdir/$pkgname/packaging/licenses/THIRD-PARTY-NOTICES.tflite" \
        "$pkgdir/usr/share/irlume/tflite/THIRD-PARTY-NOTICES"
    install -Dm0644 packaging/systemd/irlumed.service "$pkgdir/usr/lib/systemd/system/irlumed.service"
    install -Dm0644 packaging/systemd/irlumed.socket "$pkgdir/usr/lib/systemd/system/irlumed.socket"
    # Self-heal: re-applies irlume's greeter PAM lines if a distro update strips
    # them. No-op until `irlume login enable` writes its marker.
    install -Dm0644 packaging/systemd/irlume-reconcile.path "$pkgdir/usr/lib/systemd/system/irlume-reconcile.path"
    install -Dm0644 packaging/systemd/irlume-reconcile.service "$pkgdir/usr/lib/systemd/system/irlume-reconcile.service"
    install -Dm0644 packaging/systemd/irlume-reconcile.timer "$pkgdir/usr/lib/systemd/system/irlume-reconcile.timer"
    # AppArmor profile for the daemon. Arch does not run AppArmor by default, so
    # it sits inert unless the user boots with `lsm=...,apparmor`; irlume.install
    # loads it only when apparmor_parser is present. The profile confines the
    # /usr/bin/irlumed binary (same path Arch installs to) and already covers the
    # system onnxruntime under /usr/lib, so no Arch-specific variant is needed.
    install -Dm0644 packaging/apparmor/usr.bin.irlumed "$pkgdir/etc/apparmor.d/usr.bin.irlumed"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    # The machine-API contract, beside the engine that implements it: a consumer
    # validating our JSON should never have to guess which schema this build speaks.
    install -Dm0644 schemas/machine-api-v1.schema.json "$pkgdir/usr/share/irlume/schemas/machine-api-v1.schema.json"
    install -Dm0644 docs/MACHINE-API.md "$pkgdir/usr/share/doc/$pkgname/MACHINE-API.md"
    install -Dm0644 docs/INTEGRATION.md "$pkgdir/usr/share/doc/$pkgname/INTEGRATION.md"
}
