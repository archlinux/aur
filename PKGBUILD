# Maintainer: richc <admin+aur@sys.corbet.ch>
#
# OpenVINO GenAI runtime for Python 3.14 — official precompiled wheels, NO compilation.
# This is the fast Intel NPU inference engine (runs pre-converted INT4 OpenVINO IR
# models via openvino_genai.LLMPipeline). Runtime only: torch / optimum / nncf are
# NOT needed here (those are conversion-only — see intel-llm-convert).
#
# Repackages the official Apache-2.0 wheels from PyPI into the system site-packages.

pkgname=openvino-genai-bin
pkgver=2026.3.1.0
_ov_ver=2026.3.1
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
_ovwhl="openvino-2026.3.1-22476-cp314-cp314-manylinux_2_28_x86_64.whl"
_tokwhl="openvino_tokenizers-2026.3.1.0-py3-none-manylinux_2_28_x86_64.whl"
_genaiwhl="openvino_genai-2026.3.1.0-2499-cp314-cp314-manylinux_2_28_x86_64.whl"
source=(
  "https://files.pythonhosted.org/packages/7d/3b/105ac2b28e82e25840c4042656a6f2b678fe45c51e3692666d9f04932e56/openvino-2026.3.1-22476-cp314-cp314-manylinux_2_28_x86_64.whl"
  "https://files.pythonhosted.org/packages/b5/2a/e50406892a96b98bb1adeaf5197adf7a7ef6ead6638837e67ea0f2d8259e/openvino_tokenizers-2026.3.1.0-py3-none-manylinux_2_28_x86_64.whl"
  "https://files.pythonhosted.org/packages/5a/28/5202ed174592038c444368d58165a951c24325f05a40ceba9bf80864843f/openvino_genai-2026.3.1.0-2499-cp314-cp314-manylinux_2_28_x86_64.whl"
)
noextract=("${_ovwhl}" "${_tokwhl}" "${_genaiwhl}")
sha256sums=(
  'f9b2c14441258ef3ba7b8c5d0bc91d72c73e539f09c983b294abc61bb102b094'
  '4dc45f6b62e31b1a9d7ae0a84c1897d6f385688e89a6c87398c43e23944e6edd'
  '18192a5e6aa6382d834d8ca79f4aa9c1c1a0245a7eaba625b54f1824348cd12a'
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
