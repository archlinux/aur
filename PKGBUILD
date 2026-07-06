# Maintainer: Swix
# Based on Qualcomm QAIc Apps SDK install.sh

pkgname=qaic-apps-sdk
pkgver=1.21.6.0
pkgrel=1
pkgdesc="Qualcomm QAIc Apps SDK - model compiler, execution runtime, and development tools"
arch=(x86_64)
url="https://quic.github.io/cloud-ai-sdk-pages/1.21/Getting-Started/Installation/apps-sdk.html"
license=("LicenseRef-Qualcomm")
options=("!strip")
_arch=${CARCH}
depends=(gcc-libs qaic-platform-sdk)
optdepends=(
  "cmake: build C/C++ custom-op examples"
  "python: Python bindings and Python-based tools"
  "python-colorama: qaic-prepare-model scripts"
  "python-cryptography: qaic-encrypt attestation verification"
  "python-jsonschema: model configurator validation"
  "python-numpy: SmartNMS and pytools accuracy evaluation"
  "python-psutil: model configurator and aic-manager monitoring"
  "python-pytorch: torch-qaic backend integration"
  "python-setuptools: build custom-op and qaic examples"
  "python-virtualenv: qaic-pytools and qeff virtual environments"
  "git: qefficient-library (qeff) installation"
)
install="${pkgname}.install"
source_x86_64=(
  "aic_apps.Core.${pkgver}.Linux-AnyCPU-aic_apps.Core.${pkgver}.Linux-AnyCPU.zip::local://aic_apps.Core.${pkgver}.Linux-AnyCPU-aic_apps.Core.${pkgver}.Linux-AnyCPU.zip"
)
sha256sums_x86_64=(
  "5449b1ad0058fc9c219d2066cfe02b428e6d35afeac6b0cec32ae1f6a1ce8b11"
)

prepare() {
  # Extract the Qualcomm SDK zip
  unzip -oq "${srcdir}/aic_apps.Core.${pkgver}.Linux-AnyCPU-aic_apps.Core.${pkgver}.Linux-AnyCPU.zip"
}

package() {
  local sdk_dir="${srcdir}/qaic-apps-${pkgver}"
  local deb_dir="${sdk_dir}/${_arch}/deb"
  local common_dir="${sdk_dir}/common"

  # =========================================================================
  # Create all target directories upfront
  # =========================================================================
  install -dm755 "${pkgdir}/opt/qti-aic"/{exec,versions}
  install -dm755 "${pkgdir}/opt/qti-aic/dev"/{lib/{${_arch}/apps,common/qaicmlops,custom_op},inc,python,proto}
  install -dm755 "${pkgdir}/opt/qti-aic/examples"/{apps,scripts}
  install -dm755 "${pkgdir}/opt/qti-aic/scripts"
  install -dm755 "${pkgdir}/opt/qti-aic/tools"/{onnxrt-custom-ops,custom-ops,rcnn-exporter,aic-manager,opstats-profiling}

  # =========================================================================
  # Executables
  # =========================================================================
  install -Dm755 "${deb_dir}/exec/qaic-compile" \
    "${pkgdir}/opt/qti-aic/exec/qaic-compile"
  install -Dm755 "${deb_dir}/exec/qaic-exec" \
    "${pkgdir}/opt/qti-aic/exec/qaic-exec"
  install -Dm755 "${deb_dir}/exec/qaic-opstats" \
    "${pkgdir}/opt/qti-aic/exec/qaic-opstats"

  # =========================================================================
  # Dev libraries (arch-specific)
  # =========================================================================
  for _lib in "${deb_dir}/dev/lib/"*; do
    [ -f "$_lib" ] && install -m644 "$_lib" \
      "${pkgdir}/opt/qti-aic/dev/lib/${_arch}/"
  done
  for _lib in "${deb_dir}/dev/lib/apps/"*; do
    [ -f "$_lib" ] && install -m644 "$_lib" \
      "${pkgdir}/opt/qti-aic/dev/lib/${_arch}/apps/"
  done

  # Common custom_op / qaicmlops libs
  cp -a "${common_dir}/dev/lib/custom_op/"* \
    "${pkgdir}/opt/qti-aic/dev/lib/custom_op/"
  cp -a "${common_dir}/dev/lib/qaicmlops/"* \
    "${pkgdir}/opt/qti-aic/dev/lib/common/qaicmlops/"

  # =========================================================================
  # Dev headers (common)
  # =========================================================================
  cp -a "${common_dir}/dev/inc/"* \
    "${pkgdir}/opt/qti-aic/dev/inc/"

  # =========================================================================
  # Hexagon tools (arch-specific) + symlink
  # =========================================================================
  local _hexagon_ver
  _hexagon_ver=$(ls -d "${sdk_dir}/${_arch}/common/hexagon_tools-"* 2>/dev/null \
    | sort -V | tail -n 1 | xargs basename)
  cp -a "${sdk_dir}/${_arch}/common/hexagon_tools"* \
    "${pkgdir}/opt/qti-aic/dev/"
  ln -s "${_hexagon_ver}" \
    "${pkgdir}/opt/qti-aic/dev/hexagon_tools"

  # =========================================================================
  # Python helpers + Remote Attestation Python clients (common + deb)
  # =========================================================================
  cp -a "${common_dir}/dev/python/"* \
    "${pkgdir}/opt/qti-aic/dev/python/"
  install -m644 "${deb_dir}/qaic-encrypt/QAicRemoteAttestation_pb2.py" \
    "${pkgdir}/opt/qti-aic/dev/python/"
  install -m644 "${deb_dir}/qaic-encrypt/QAicRemoteAttestation_pb2_grpc.py" \
    "${pkgdir}/opt/qti-aic/dev/python/"

  # Proto files
  install -Dm644 "${deb_dir}/qaic-encrypt/QAicRemoteAttestation.proto" \
    "${pkgdir}/opt/qti-aic/dev/proto/QAicRemoteAttestation.proto"

  # =========================================================================
  # Integrations
  # =========================================================================
  install -dm755 "${pkgdir}/opt/qti-aic/integrations"
  cp -a "${common_dir}/integrations/"* \
    "${pkgdir}/opt/qti-aic/integrations/"

  # =========================================================================
  # Tools: qaic-encrypt
  # =========================================================================
  install -Dm755 "${deb_dir}/qaic-encrypt/qaic-encrypt" \
    "${pkgdir}/opt/qti-aic/tools/qaic-encrypt/qaic-encrypt"
  install -Dm755 "${deb_dir}/qaic-encrypt/qaic-qpc-lite" \
    "${pkgdir}/opt/qti-aic/tools/qaic-encrypt/qaic-qpc-lite"
  install -Dm644 "${deb_dir}/qaic-encrypt/bindings.h" \
    "${pkgdir}/opt/qti-aic/tools/qaic-encrypt/bindings.h"
  install -Dm644 "${deb_dir}/qaic-encrypt/libqaic_encrypt.so" \
    "${pkgdir}/opt/qti-aic/tools/qaic-encrypt/libqaic_encrypt.so"
  install -Dm644 "${deb_dir}/qaic-encrypt/QAicRemoteAttestationClient.py" \
    "${pkgdir}/opt/qti-aic/tools/qaic-encrypt/QAicRemoteAttestationClient.py"
  cp -a "${deb_dir}/qaic-encrypt/qaic_verify_attestation" \
    "${pkgdir}/opt/qti-aic/tools/qaic-encrypt/qaic_verify_attestation"
  cp -a "${deb_dir}/qaic-encrypt/qwes_certs" \
    "${pkgdir}/opt/qti-aic/tools/qaic-encrypt/qwes_certs"

  # =========================================================================
  # Tools: SmartNMS
  # =========================================================================
  install -dm755 "${pkgdir}/opt/qti-aic/tools/smart-nms"
  cp -a "${deb_dir}/tools/smart-nms/"* \
    "${pkgdir}/opt/qti-aic/tools/smart-nms/"

  # =========================================================================
  # Tools: onnxrt-custom-ops
  # =========================================================================
  cp -a "${deb_dir}/tools/custom-ops/lib/"* \
    "${pkgdir}/opt/qti-aic/tools/onnxrt-custom-ops/"

  # =========================================================================
  # Tools: package-generator -> custom-ops
  # =========================================================================
  cp -a "${common_dir}/tools/package-generator/"* \
    "${pkgdir}/opt/qti-aic/tools/custom-ops/"

  # =========================================================================
  # Tools: rcnn-exporter
  # =========================================================================
  cp -a "${common_dir}/tools/rcnn-exporter/"* \
    "${pkgdir}/opt/qti-aic/tools/rcnn-exporter/"

  # =========================================================================
  # Tools: aic-manager, opstats-profiling
  # =========================================================================
  cp -a "${common_dir}/tools/aic-manager" \
    "${pkgdir}/opt/qti-aic/tools/aic-manager"
  cp -a "${common_dir}/tools/opstats-profiling" \
    "${pkgdir}/opt/qti-aic/tools/opstats-profiling"
  # qaic-version-util is provided by qaic-platform-sdk

  # =========================================================================
  # Scripts (model configurator — deb + common)
  # =========================================================================
  cp -a "${deb_dir}/scripts/"* \
    "${pkgdir}/opt/qti-aic/scripts/"
  cp -a "${common_dir}/scripts/"* \
    "${pkgdir}/opt/qti-aic/scripts/"

  # =========================================================================
  # Examples
  # =========================================================================
  cp -a "${common_dir}/examples/apps/"* \
    "${pkgdir}/opt/qti-aic/examples/apps/"
  cp -a "${common_dir}/examples/scripts/"* \
    "${pkgdir}/opt/qti-aic/examples/scripts/"
  # --install-torch-qaic extras
  cp -a "${common_dir}/examples/apps-pytorch/qaic-ml" \
    "${pkgdir}/opt/qti-aic/examples/apps/qaic-ml"

  # =========================================================================
  # Version metadata
  # =========================================================================
  install -Dm644 "${deb_dir}/versions/apps.xml" \
    "${pkgdir}/opt/qti-aic/versions/apps.xml"

  # =========================================================================
  # License & notices
  # =========================================================================
  install -Dm644 "${sdk_dir}/LICENSE.pdf" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
  install -Dm644 "${sdk_dir}/Notice.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/Notice.txt"

  # =========================================================================
  # ldconfig — shared libs are under /opt/qti-aic
  # =========================================================================
  install -Dm644 /dev/null "${pkgdir}/etc/ld.so.conf.d/qaic-apps-sdk.conf"
  echo "/opt/qti-aic/dev/lib/${_arch}" \
    > "${pkgdir}/etc/ld.so.conf.d/qaic-apps-sdk.conf"

  # =========================================================================
  # Clean up __pycache__ and .git files (not needed in package)
  # =========================================================================
  find "${pkgdir}" -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
  find "${pkgdir}" -name ".git" -not -type d -delete 2>/dev/null || true
}
