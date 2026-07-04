# Maintainer: richc <admin+aur@sys.corbet.ch>
#
# OpenVINO GenAI runtime for Python 3.14 — official precompiled wheels, NO compilation.
# This is the fast Intel NPU inference engine (runs pre-converted INT4 OpenVINO IR
# models via openvino_genai.LLMPipeline). Runtime only: torch / optimum / nncf are
# NOT needed here (those are conversion-only — see intel-llm-convert).
#
# Repackages the official Apache-2.0 wheels from PyPI into the system site-packages.

pkgname=openvino-genai-bin
pkgver=2026.2.1.0
_ov_ver=2026.2.1
pkgrel=1
pkgdesc="OpenVINO GenAI runtime (Python 3.14) — fast Intel NPU/GPU/CPU LLM inference, precompiled"
arch=('x86_64')
url='https://github.com/openvinotoolkit/openvino.genai'
license=('Apache-2.0')
depends=('python' 'python-numpy' 'gcc-libs' 'glibc')
optdepends=(
  'intel-npu-driver: Intel NPU (AI Boost) inference'
  'intel-compute-runtime: Intel GPU inference'
)
# NB: no provides=('python-openvino') — the wheel bundles its own self-contained
# C++ runtime under site-packages, independent of the /opt openvino-bin package,
# and claiming that virtual name would falsely conflict with it.
makedepends=('python-installer')
_ovwhl="openvino-${_ov_ver}-21919-cp314-cp314-manylinux_2_28_x86_64.whl"
_tokwhl="openvino_tokenizers-${pkgver}-py3-none-manylinux_2_28_x86_64.whl"
_genaiwhl="openvino_genai-${pkgver}-2351-cp314-cp314-manylinux_2_28_x86_64.whl"
source=(
  "https://files.pythonhosted.org/packages/43/65/b7f2a382e1da48c6cce109e7960714aa0a0608f2fb6b00388594b5d8edd2/${_ovwhl}"
  "https://files.pythonhosted.org/packages/d5/a9/42364380e0561f5c4fe3a8df1ce91f1f052238a37c7a96793b7542620785/${_tokwhl}"
  "https://files.pythonhosted.org/packages/9a/8d/d86c018e508e8c8985f41e99200843dd8f2ce7004656075aa33d9dc23645/${_genaiwhl}"
)
noextract=("${_ovwhl}" "${_tokwhl}" "${_genaiwhl}")
sha256sums=(
  '0ec716ddd84a63534613171d27c8657c8417734a1cccedeb40533e8673a12c6d'
  '74a787920280c3287a120648dfb9863821ee63cf44aa9408dd140fd30cd82a5d'
  'b3048efed6618ffe70c0b14b28464c21c85404a8255240bdbf31e2138598f7a7'
)

package() {
  cd "$srcdir"
  python -m installer --destdir="$pkgdir" "${_ovwhl}" "${_tokwhl}" "${_genaiwhl}"

  # Drop the bundled numpy dist-info if present (we depend on system python-numpy).
  local site
  site="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
  install -Dm644 <(echo "See openvino / openvino.genai — Apache-2.0") \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
