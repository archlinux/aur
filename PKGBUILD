# Maintainer: bencevarga <bence@varga.bio>
# Upstream tag: v0.1.45-poly.2 (pkgver cannot contain a hyphen, so - becomes .)

pkgname=polystrata
pkgver=0.1.45.poly.2
pkgrel=1
pkgdesc='Run large AI models on your own PC: Qwen3.8-Flash-Next, GLM 5.3 Flash, DeepSeek V4 Flash and more, on NVIDIA or AMD GPUs'
arch=('any')
url='https://github.com/VecSzn/PolyStrata'
license=('MIT')
# The engine is compiled on the user's PC on the first start (the GPU decides
# CUDA or HIP), so the build tools are runtime dependencies here.
depends=('python' 'gcc' 'git')
optdepends=(
	'cuda: NVIDIA GPU engine (upstream builds with CUDA 13.0; nvcc is found on PATH or in /opt/cuda*)'
	'rocm-hip-sdk: AMD GPU engine through a system ROCm 7 in /opt/rocm (otherwise ROCm is downloaded into the venv on first start)'
)
install=polystrata.install
_tag="v0.1.45-poly.2"
source=("https://github.com/VecSzn/PolyStrata/archive/refs/tags/$_tag.tar.gz"
        'polystrata.sh')
sha256sums=('ed1e197091c6d5fa99da387142d89ba7f5254bb53c340575c3c8a250f598c764'
            '5b13f46009a8baa3e4b5e85e63f44dcf8399f9fec9dd7b5a3ff59843f0a57c66')

# The release asset is the Windows engine; on Linux upstream installs by
# cloning this tree and running ./setup.sh. The package ships that tree under
# /opt plus a launcher that copies it into $HOME (setup.sh writes its venv,
# the compiled engine and the models next to itself, without root) and runs
# upstream's own setup.sh.

prepare() {
	sed -e "s/@@PKGVER@@/$pkgver/" -e "s/@@PKGREL@@/$pkgrel/" \
		"$srcdir/polystrata.sh" > "$srcdir/polystrata-launcher.sh"
}

package() {
	install -Dm755 "$srcdir/polystrata-launcher.sh" "$pkgdir/usr/bin/polystrata"
	install -Dm755 "$srcdir/polystrata-launcher.sh" "$pkgdir/usr/bin/polystrata-update"
	mkdir -p "$pkgdir/opt/polystrata"
	cp -a "$srcdir/PolyStrata-0.1.45-poly.2/." "$pkgdir/opt/polystrata/"
	install -Dm644 "$srcdir/PolyStrata-0.1.45-poly.2/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
