# Maintainer: Ashish Singh <ashish.singh1@live.in>
_pkgbase=whisper.cpp
pkgname=whisper.cpp-talk
pkgver=1.7.6
pkgrel=2
pkgdesc="Whisper.cpp built with cuda & talk-llama enabled"
arch=(x86_64)
url="https://github.com/ggml-org/whisper.cpp"
license=('MIT')
depends=(sdl2-compat git espeak-ng ggml-cublas-git)
makedepends=(cmake ccache)
optdepends=('cuda: GPU acceleration for NVidia GPUs'
	'vulkan-devel: GPU acceleration for non-NVidia GPUs'
	'openblas: CPU acceleration')
options=(ccache)
source=("git+https://github.com/ggml-org/whisper.cpp.git#commit=040510a132f0a9b51d4692b57a6abfd8c9660696")
sha256sums=('SKIP')

_build_flags=()
_enable_talk=true

# Define compute capability function
get_compute_capability() {
	local name="$1"

	if [[ "$name" =~ RTX[[:space:]]PRO ]]; then
		echo "120"

	elif [[ "$name" =~ NVIDIA[[:space:]]RTX[[:space:]]A ]]; then
		echo "86"

	elif [[ "$name" =~ NVIDIA[[:space:]]RTX ]]; then
		echo "89"

	elif [[ "$name" =~ Jetson ]]; then
		echo "87"

	elif [[ "$name" =~ NVIDIA[[:space:]]RTX ]] || [[ "$name" =~ NVIDIA[[:space:]]A[0-9] ]]; then
		echo "86"

	elif [[ "$name" =~ GeForce[[:space:]]RTX[[:space:]]([0-9]{2}) ]]; then
		model_prefix="${BASH_REMATCH[1]}"
		case "$model_prefix" in
			20) echo "75" ;;
			30) echo "86" ;;
			40) echo "89" ;;
			50) echo "120" ;;
			16) echo "75" ;;
		esac
	else
		echo "75"
	fi

}

prepare() {
	# Check if cuda is installed
	if ! command -v nvcc &> /dev/null; then
		echo "CUDA not found!"
		_cuda_found=false
	       	# Detect AMD GPU (OpenGL/compute capable)
		if lspci | grep -E "VGA|3D" | grep -iq "AMD"; then
			echo "AMD GPU detected — enabling Vulkan support."
			_build_flags+=(-DGGML_VULKAN=1)
		# Detect OpenBLAS
		elif [[ -f /usr/lib/libopenblas.so ]]; then
			echo "OpenBLAS found! Enabling CPU acceleration"
			_build_flags+=(-DGGML_BLAS=1)
		else
			echo "If you have NVidia GPU, please install CUDA & rebuild to improve LLM speed."
		fi
	else
		_build_flags+=(-DGGML_CUDA=1)
		# Detect NVIDIA GPU architecture - https://developer.nvidia.com/cuda-gpus
		_comp_cap=0
		# Map architecture name to compute capability (add more as needed)
		nvidia-smi -L | while read -r line; do
			gpu_id=$(echo "$line" | grep -oP '^GPU \d+')
			gpu_name=$(echo "$line" | sed -E 's/^GPU [0-9]+: (.+) \(UUID.*/\1/' | xargs)
			_cc=$(get_compute_capability "$gpu_name")
			if [[ $_comp_cap<$_cc ]]; then
				_comp_cap=$_cc
			fi
			echo "$gpu_id: $gpu_name (Compute Capability: $_cc)"
		done
		_build_flags+=(-DCMAKE_CUDA_ARCHITECTURES="${_comp_cap}")
		_cuda_found=true
	fi

	# Modify default location of whisper model
	cd ${srcdir}/${_pkgbase}
	for dir in examples/*/; do
		[ -d "$dir" ] || continue
		base="$(basename "$dir")"
		target="${dir}${base}.cpp"
		if [ -f "$target" ]; then
			sed -i 's#"models/ggml-base.en.bin"#"/usr/share/whisper/models/ggml-base.en.bin"#g' "$target"
			# Some more directory fixes for whisper.cpp-talk-llama
			if [[ $base == "talk-llama" ]]; then
				sed -i 's#./examples/talk-llama/speak#/usr/share/whisper/talk-llama/speak#g' "$target"
				sed -i 's#"./examples/talk-llama/to_speak.txt"#std::string(std::getenv("HOME"))+"/.cache/whisper/to_speak.txt"#g' "$target"
			fi
		fi
	done
	# Also, download this model
	# ./models/download-ggml-model.sh base.en 	# Prints repeatedly
	curl --skip-existing -L -o models/ggml-base.en.bin \
		"https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-base.en.bin"
}

build() {
	cd ${srcdir}/${_pkgbase}
	if [[ ${_enable_talk} == 'true' ]]; then
		_build_flags+=(-DWHISPER_SDL2=ON)
	fi
	if [[ ${_cuda_found}  == 'true' ]]; then
		export CC=/usr/bin/gcc-13
		export CXX=/usr/bin/g++-13
	fi
	cmake -B build \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DWHISPER_USE_SYSTEM_GGML=1 \
		"${_build_flags[@]}"
	cmake --build build -j --config Release
}

package() {
	DESTDIR="${pkgdir}" cmake --install "${srcdir}/${_pkgbase}/build"

	cd "${srcdir}/${_pkgbase}/build/bin"
	for i in whisper-*; do
		install -Dm755 "${i}" \
			"${pkgdir}/usr/bin/${i}"
	done

	install -Dm644 "${srcdir}/${_pkgbase}/LICENSE" \
		-t "${pkgdir}/usr/share/licenses/${_pkgbase}"

	# Install model file
	install -Dm644 "${srcdir}/${_pkgbase}/models/ggml-base.en.bin" \
		"$pkgdir/usr/share/whisper/models/ggml-base.en.bin"
	# Install speak file for talk-llama
	install -Dm755 "${srcdir}/${_pkgbase}/examples/talk-llama/speak" \
		"$pkgdir/usr/share/whisper/talk-llama/speak"
}
