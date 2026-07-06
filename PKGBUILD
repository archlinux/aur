# Maintainer: Swix
# Based on Qualcomm QAIc Platform SDK install.sh

pkgname=qaic-platform-sdk
pkgver=1.21.6.0
pkgrel=1
pkgdesc="Qualcomm AI Engine (QAIc) Platform SDK - firmware, kernel module (DKMS), and runtime tools"
arch=(x86_64)
url="https://quic.github.io/cloud-ai-sdk-pages/1.21/Getting-Started/Installation/download-sdks.html"
license=("LicenseRef-Qualcomm")
_arch=${CARCH}  # SDK zip uses arch-specific subdirs
depends=(dkms pciutils)
optdepends=(
  "cmake: build C/C++ examples"
  "protobuf: protobuf tooling"
  "python: qaicrt Python bindings and Python-based tools"
  "python-numpy: JIT wrapper and log viewer"
  "python-pyelftools: JIT wrapper"
  "python-pyudev: device detection and configuration"
  "mokutil: SecureBoot module signing"
)
install="${pkgname}.install"
source_x86_64=(
  "aic_platform.Core.${pkgver}.Linux-AnyCPU-aic_platform.Core.${pkgver}.Linux-AnyCPU.zip::local://aic_platform.Core.${pkgver}.Linux-AnyCPU-aic_platform.Core.${pkgver}.Linux-AnyCPU.zip"
  "PowerStress"
  "0001-fix-dkms.conf-kernel-source-fallback.patch"
)
sha256sums_x86_64=(
  "eaccd02e8911c6e16a179b8352a30b6d01c915a135945bb18cf22ad58e28669b"
  "b8c14d64079394cbdd4b61c14afda1bb4e0c90394f15aa54f06b789e22a3e000"
  "c3a82d8530f3dbd24a7d447c638197f4b62c058a57728cc2f08758dcb6cd0c76"
)

prepare() {
  # Extract the Qualcomm SDK zip (overwrite existing)
  unzip -oq "${srcdir}/aic_platform.Core.${pkgver}.Linux-AnyCPU-aic_platform.Core.${pkgver}.Linux-AnyCPU.zip"

  # Extract Debian .deb packages
  mkdir -p {fw,kmd,rt}

  local sdk_dir="${srcdir}/qaic-platform-sdk-${pkgver}"
  local deb_dir="${sdk_dir}/${_arch}/deb/deb"

  # Extract qaic-fw
  cd fw
  ar x "${deb_dir}/qaic-fw_${pkgver}.deb"
  tar xf data.tar.*

  # Extract qaic-kmd
  cd ../kmd
  ar x "${deb_dir}/qaic-kmd_${pkgver}_all.deb"
  tar xf data.tar.*
  cd "${srcdir}/kmd"
  patch -p1 < "${srcdir}/0001-fix-dkms.conf-kernel-source-fallback.patch"

  # Extract qaic-rt
  cd ../rt
  ar x "${deb_dir}/qaic-rt_${pkgver}_amd64.deb"
  tar xf data.tar.*

  cd ..
}

package() {
  local sdk_dir="${srcdir}/qaic-platform-sdk-${pkgver}"

  # Firmware
  install -dm755 "${pkgdir}/usr/lib/firmware/updates/qcom/aic100"
  for _fw in fw/lib/firmware/updates/qcom/aic100/*.bin; do
    install -m644 "$_fw" "${pkgdir}/usr/lib/firmware/updates/qcom/aic100/"
  done

  # Firmware config JSONs
  install -dm755 "${pkgdir}/opt/qti-aic/firmware"
  for _fw_json in fw/opt/qti-aic/firmware/*.json rt/opt/qti-aic/firmware/*.json; do
    [ -f "$_fw_json" ] && install -m644 "$_fw_json" "${pkgdir}/opt/qti-aic/firmware/"
  done

  # udev rules
  install -Dm644 fw/etc/udev/rules.d/55-qaic-fw.rules \
    "${pkgdir}/etc/udev/rules.d/55-qaic-fw.rules"

  # Tools from fw package
  install -Dm755 fw/opt/qti-aic/tools/qaic_coredump \
    "${pkgdir}/opt/qti-aic/tools/qaic_coredump"
  install -Dm755 fw/opt/qti-aic/tools/qaic-version-util \
    "${pkgdir}/opt/qti-aic/tools/qaic-version-util"
  install -Dm644 fw/opt/qti-aic/tools/qaic-config-num-nsps.pyc \
    "${pkgdir}/opt/qti-aic/tools/qaic-config-num-nsps.pyc"
  install -Dm644 fw/opt/qti-aic/tools/cd_parser.py \
    "${pkgdir}/opt/qti-aic/tools/cd_parser.py"

  # LLDB extension (VSCode + scripts)
  cp -a fw/opt/qti-aic/tools/lldb "${pkgdir}/opt/qti-aic/tools/lldb"

  # Kernel Module (DKMS source)
  mkdir -p "${pkgdir}/usr/src/"
  cp -a kmd/usr/src/qaic-${pkgver} "${pkgdir}/usr/src/qaic-${pkgver}"

  # Runtime: dev headers, libs, examples, proto, python
  cp -a rt/opt/qti-aic/dev "${pkgdir}/opt/qti-aic/dev"
  install -Dm644 rt/opt/qti-aic/lib/libQAicTestCommon.a \
    "${pkgdir}/opt/qti-aic/lib/libQAicTestCommon.a"

  # Runtime config
  cp -a rt/opt/qti-aic/config "${pkgdir}/opt/qti-aic/config"

  # Runtime executables
  local rt_tool
  for rt_tool in rt/opt/qti-aic/exec/*; do
    [ -f "$rt_tool" ] && install -Dm755 "$rt_tool" \
      "${pkgdir}/opt/qti-aic/exec/$(basename "$rt_tool")"
  done

  # Runtime tools
  for rt_tool in rt/opt/qti-aic/tools/*; do
    [ -f "$rt_tool" ] && install -Dm755 "$rt_tool" \
      "${pkgdir}/opt/qti-aic/tools/$(basename "$rt_tool")"
  done

  # JIT files
  cp -a rt/opt/qti-aic/jit "${pkgdir}/opt/qti-aic/jit"

  # Auxiliary scripts from installer
  install -Dm755 "${sdk_dir}/${_arch}/deb/soc_reset.sh" \
    "${pkgdir}/opt/qti-aic/scripts/soc_reset.sh"
  install -Dm755 "${sdk_dir}/${_arch}/deb/setup_mdp.sh" \
    "${pkgdir}/opt/qti-aic/scripts/setup_mdp.sh"

  # Runtime scripts (from rt package)
  install -dm755 "${pkgdir}/opt/qti-aic/scripts"
  cp -a rt/opt/qti-aic/scripts/* "${pkgdir}/opt/qti-aic/scripts/"

  # Systemd services
  install -Dm644 rt/opt/qti-aic/services/qaic-remote-proxy.service \
    "${pkgdir}/usr/lib/systemd/system/qaic-remote-proxy.service"
  install -Dm644 rt/opt/qti-aic/services/qmonitor-proxy.service \
    "${pkgdir}/usr/lib/systemd/system/qmonitor-proxy.service"

  # Platform version info
  install -Dm644 "${sdk_dir}/${_arch}/deb/platform.xml" \
    "${pkgdir}/opt/qti-aic/versions/platform.xml"

  # License
  install -Dm644 "${sdk_dir}/LICENSE.pdf" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"

  # Notice.txt (third-party open-source notices)
  install -Dm644 "${sdk_dir}/${_arch}/deb/Notice.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/Notice.txt"

  # PCIe tools
  install -Dm755 "${sdk_dir}/${_arch}/deb/pcie_tool_cli" \
    "${pkgdir}/opt/qti-aic/tools/pcie_tool_cli"
  install -Dm644 "${sdk_dir}/${_arch}/deb/config_pcie_tool.json" \
    "${pkgdir}/opt/qti-aic/config/config_pcie_tool.json"
  install -Dm755 "${sdk_dir}/${_arch}/deb/PowerStress" \
    "${pkgdir}/opt/qti-aic/tools/PowerStress.bin"
  install -Dm755 "${srcdir}/PowerStress" \
    "${pkgdir}/opt/qti-aic/tools/PowerStress"

  # Test data
  local test_data_path="${pkgdir}/opt/qti-aic/test-data"
  install -dvm755 "$test_data_path"
  tar --no-same-owner -xf "${sdk_dir}/common/qaic-test-data/qaic-test-data_1.0.0.tar.gz" \
    --directory "$test_data_path"

  # Workload binaries
  # PowerStress checks newfstatat(AT_FDCWD, "./Workload")
  # Must be uppercase "Workload" and run from /opt/qti-aic/
  local workload_path="${pkgdir}/opt/qti-aic/Workload"
  install -Dm755 "${sdk_dir}/${_arch}/deb/Workload/x86_qaic_nwdesc_writer_json" \
    "${workload_path}/x86_qaic_nwdesc_writer_json"
  install -Dm644 "${sdk_dir}/${_arch}/deb/Workload/network_pcie.elf" \
    "${workload_path}/network_pcie.elf"
  install -Dm644 "${sdk_dir}/${_arch}/deb/Workload/network_synth.elf" \
    "${workload_path}/network_synth.elf"

  # Fix permissions on scripts extracted from upstream tarballs
  find "${pkgdir}/opt/qti-aic/scripts" -type f -exec chmod a+r {} +
}
