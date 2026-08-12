# Maintainer: richc <admin+aur@sys.corbet.ch>
#
# OpenVINO GenAI runtime for Python 3.14 — official precompiled wheels, NO compilation.
# This is the fast Intel NPU inference engine (runs pre-converted INT4 OpenVINO IR
# models via openvino_genai.LLMPipeline). Runtime only: torch / optimum / nncf are
# NOT needed here (those are conversion-only — see intel-llm-convert).
#
# Repackages the official Apache-2.0 wheels from PyPI into the system site-packages.

pkgname=openvino-genai-bin
pkgver=2026.3.0.0
_ov_ver=2026.3.0
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
_ovwhl="openvino-2026.3.0-22451-cp314-cp314-manylinux_2_28_x86_64.whl"
_tokwhl="openvino_tokenizers-2026.3.0.0-py3-none-manylinux_2_28_x86_64.whl"
_genaiwhl="openvino_genai-2026.3.0.0-2495-cp314-cp314-manylinux_2_28_x86_64.whl"
source=(
  "https://files.pythonhosted.org/packages/d7/97/fdace942843da232ea06a5a67cc3a70d292873657dc933408fdb9bb796a8/openvino-2026.3.0-22451-cp314-cp314-manylinux_2_28_x86_64.whl"
  "https://files.pythonhosted.org/packages/0b/68/c1ba2177f4ce1f455aae858548aece8b6491b862a6458b03c5d5dbf356ef/openvino_tokenizers-2026.3.0.0-py3-none-manylinux_2_28_x86_64.whl"
  "https://files.pythonhosted.org/packages/ed/02/ed9f6773a40cc8b0fc166979abf6b56aed3a9f5840f9f0bf76fbf82cc349/openvino_genai-2026.3.0.0-2495-cp314-cp314-manylinux_2_28_x86_64.whl"
)
noextract=("${_ovwhl}" "${_tokwhl}" "${_genaiwhl}")
sha256sums=(
  '81a64aebd1a80da93bc9413b3ba9c93846c7cac57161cd4d7b287b354d77ad19'
  '9d35bb52d353a30d1194cd21c43d3949d0fac853b5bd3721994f70acfea051e4'
  '2df610ec970b66b95cc4987d888c543e979bda515aed0c8ffda99954d10b4133'
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
