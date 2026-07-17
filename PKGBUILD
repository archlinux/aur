pkgname=volterra-firmware
pkgdesc="Microsoft Dev Kit 2023 (Project Volterra) firmware"
pkgver=0.1.0
pkgrel=1
arch=('any')
license=('LicenseRef-proprietary')
makedepends=('zstd')
depends=(
  'linux-firmware-atheros'
  'linux-firmware-qcom'
)
options=(!strip)

source=("https://files.ironrobin.net/microsoft/blackrock/qcadsp8280.mbn"
        "https://files.ironrobin.net/microsoft/blackrock/qccdsp8280.mbn"
        "qcdxkmsuc8280.mbn"
        "https://files.ironrobin.net/microsoft/blackrock/qcvss8280.mbn"
        "adspr.jsn"
        "adspua.jsn"
        "battmgr.jsn"
        "cdspr.jsn"
        "https://files.ironrobin.net/microsoft/blackrock/board-2.bin"
)
sha256sums=('bb8a55650bceaec09edadfde4bee54563f03fb072fa9807d91857e0a96b33310'
            '5da3feeb5ca7231c14a3dcfa1a137644f2955dca46909897334bb4012df06320'
            '38012c7a55da315f5ae345170da035be90d48b49d81eef9cdb982f5bcbce8e43'
            '3f4975f9f074707fbd702cc3998d09568cdfd1008c5c2f7877f91137c38c9ed9'
            '4b9566fcfdc1656c38d8158d79db6964e9c4b57a6e42b46241e8d63aabc42d8d'
            'd65dc1aedce2c1131da8ffaed7dcffc05cc9c58da491e0c39acb2ac5b3f4bc1d'
            'b8aad1d149128f414eb1fd6fcbb6e0a5b7dabcd2cba001599e1ce9a0e2e291a4'
            '7e46c515ab1bb012768be6e961eca69b1c8aad9af1cbac886b3b5ae8d4228f64'
            '736544b268c43181df3529ad0d8978a2c25bc5744d1bbcfae8bc4b0feb13687a')

package() {
  local _qcom_dir="${pkgdir}/usr/lib/firmware/updates/qcom/sc8280xp/microsoft/blackrock"
  install -dm755 "${_qcom_dir}"
  install -m644 adspr.jsn adspua.jsn battmgr.jsn cdspr.jsn "${_qcom_dir}"

  zstd -19 -k -f qcadsp8280.mbn
  zstd -19 -k -f qccdsp8280.mbn
  zstd -19 -k -f qcdxkmsuc8280.mbn
  zstd -19 -k -f qcvss8280.mbn
  install -m644 qcadsp8280.mbn.zst qccdsp8280.mbn.zst qcdxkmsuc8280.mbn.zst qcvss8280.mbn.zst "${_qcom_dir}"

  # Override the distro-provided ath11k board file without conflicting with
  # linux-firmware-atheros, which owns the regular ath11k firmware tree.
  local _ath11k_dir="${pkgdir}/usr/lib/firmware/updates/ath11k/WCN6855"
  zstd -19 -k -f board-2.bin
  install -Dm644 board-2.bin.zst "${_ath11k_dir}/hw2.0/board-2.bin.zst"

  # Volterra's WiFi card identifies itself as hw2.1 but uses the hw2.0 data.
  install -dm755 "${_ath11k_dir}/hw2.1"
  ln -s ../hw2.0/board-2.bin.zst "${_ath11k_dir}/hw2.1/board-2.bin.zst"
}
