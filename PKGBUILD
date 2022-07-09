pkgbase=stt
pkgname=stt-bin 
_pkgname=STT
pkgver=1.3.0
pkgrel=1
pkgdesc="A TensorFlow implementation of Baidu's DeepSpeech architecture - Python native client + devel files."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/coqui-ai/STT"
license=('MPL2')
depends=('gcc-libs')
makedepends=('wget' 'tar')
provides=('stt')
conflicts=('stt')

# Set all sources.
_src_base_url="https://github.com/coqui-ai/STT/releases/download/v$pkgver"
_raw_base_url="https://raw.githubusercontent.com/coqui-ai/STT/v$pkgver"

# Reused checksums.
_header_sum='1e4238c018d8c1092eb23c34650cd73e1a1940740054c9674e3f8a2f091c1e6665207c2b8ff8da3ca75c06a2fc7129668798e392f57c69a7b0ff095c90e179bc'
_pc_sum='30139b795537a9a21187889daac8f24fb0ab542363a8c59c6bd53ccf5883cdf49f300d8532e1c9ed9610f75237a22948da1ec6c5247855c62871a7484b2e34da'
_pc_tflite_sum='431f552a22e2a2030a99a47f00b2c2d56cbb7adc5e2d3e78431536ae209bcc76f2324f055889d3e7e371f0e7123b845050b4bfeb242bc766fc060a32354329f5'

# amd64
source_x86_64=("$_src_base_url/stt-1.3.0-cp310-cp310-manylinux_2_24_x86_64.whl"
               "$_src_base_url/coqui_stt_ctcdecoder-1.3.0-cp310-cp310-manylinux_2_24_x86_64.whl"
                )
sha512sums_x86_64=('c7903de984f6af069c07a735c1fa0cda2f9f703313a663e18317e1d422a9f28aa9d879c21a428a4d74baaaa1d027b19d46e2abb15982e5262068a14a1d57e824'
                   '020bc4556b7ca47fa5ffdf62028a82498c46b73edd18b5c577288b7f8ed8960becc72dc94d9b018c366ee4802a37abcf7b3eadebb06fa73633f808f90365839d'
                    )

# armv7h
source_armv7h=("$_src_base_url/native_client.tflite.linux.armv7.tar.xz"
               "$_raw_base_url/native_client/coqui-stt.h"
               "stt.pc")
sha512sums_armv7h=('687fd924716ebcd53cf1f5ddf1efb44b4005f9a83f4af70756a1146c78b76d09c90add978dba40a4a7ba935a91704defbdbea3360426a09d4ac4c7f6f58248d2'
                   "$_header_sum"
                   "$_pc_sum")

# aarch64
source_aarch64=("$_src_base_url/native_client.tflite.linux.aarch64.tar.xz"
               "$_raw_base_url/native_client/coqui-stt.h"
                "stt.pc")
sha512sums_aarch64=('041400ee01bf0b863db60001972938aa1add4208df8e61a068bd4f872fe16fe9fccb23aa84c703e1181590ce19ded5453ace61670a57dfddbc18e5ef4b86c106'
                    "$_header_sum"
                    "$_pc_sum")

prepare()
{
  python -m ensurepip --upgrade --default-pip
  pip install -U wheel numpy
}

package() {
  # Create installation directories.
	#mkdir -p "$pkgdir/usr/lib"
	#mkdir -p "$pkgdir/usr/include"
	#mkdir -p "$pkgdir/usr/lib/pkgconfig"

  # Separately get a copy of the TFLite library.
  # Unfortunately, due to files having the same name, this cannot be done with the sources section.
  # Note: At this time, only x86_64 Linux has a prebuilt TFLite library.
  MACHINE_TYPE=`uname -m`
  if [ ${MACHINE_TYPE} == 'x86_64' ]; then
    # Download the STT Wheel.
    local stt_fname="stt-1.3.0-cp310-cp310-manylinux_2_24_x86_64.whl"
    local stt_sum="bad4e9fbf79996cec808d06e77f8a385669351e8ee8c91dcc13f1cfb04c2dc3731d058bab3c36595df35c75a3dcc4bf50f7c4e36b9d3a40a2ddab9ca16ac273b"
    wget "$_src_base_url/$stt_fname" -q -O "$srcdir/$stt_fname"
    local stt_sum_check=$(sha512sum "$stt_fname" | awk '{print $1}')
    if [ ${stt_sum_checkv} != "$stt_sum" ]; then
      # Bail!
      echo "Verifying STT's checksum failed!" 1>&2
      exit 1
    fi

    # Download the CTC Decoder Wheel.
    local ctc_fname="coqui_stt_ctcdecoder-1.3.0-cp310-cp310-manylinux_2_24_x86_64.whl"
    local ctc_sum="020bc4556b7ca47fa5ffdf62028a82498c46b73edd18b5c577288b7f8ed8960becc72dc94d9b018c366ee4802a37abcf7b3eadebb06fa73633f808f90365839d"
    wget "$_src_base_url/$ctc_fname" -q -O "$srcdir/$ctc_fname"
    local ctc_sum_check=$(sha512sum "$ctc_fname" | awk '{print $1}')
    if [ ${ctc_sum_check} != "$ctc_sum" ]; then
      # Bail!
      echo "Verifying CTC Decoder's checksum failed!" 1>&2
      exit 1
    fi
  fi

  # Python bindings
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps stt-*.whl
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps coqui_stt_ctcdecoder-*.whl
}