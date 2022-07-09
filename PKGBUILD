pkgbase=stt
pkgname=stt-bin 
_pkgname=STT
pkgver=1.3.0
pkgrel=1
pkgdesc="A TensorFlow implementation of Baidu's DeepSpeech architecture - Python native client + CTC decoder."
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

# amd64
source_x86_64=("$_src_base_url/stt-1.3.0-cp310-cp310-manylinux_2_24_x86_64.whl"
               "$_src_base_url/coqui_stt_ctcdecoder-1.3.0-cp310-cp310-manylinux_2_24_x86_64.whl"
                )
sha512sums_x86_64=('bad4e9fbf79996cec808d06e77f8a385669351e8ee8c91dcc13f1cfb04c2dc3731d058bab3c36595df35c75a3dcc4bf50f7c4e36b9d3a40a2ddab9ca16ac273b'
                   '020bc4556b7ca47fa5ffdf62028a82498c46b73edd18b5c577288b7f8ed8960becc72dc94d9b018c366ee4802a37abcf7b3eadebb06fa73633f808f90365839d'
                    )

# armv7h
source_armv7h=("$_src_base_url/stt-1.3.0-cp37-cp37m-linux_armv7l.whl"
               )
sha512sums_armv7h=('12099b1a2d2e6d7db3bcea9e8b6d60f4e81e2173bb639fb20c088a0346edb3fe059f184fc514b1b77e305f7b82ae14975f7c4cd10acc2bafe9a0dbe7d7170742'
                   )

# aarch64
source_aarch64=("$_src_base_url/stt-1.3.0-cp37-cp37m-linux_aarch64.whl"
               )
sha512sums_aarch64=('6513a1a35cd74a14c4bd49ea5c47c619237bb4c463159d83d773439f7b0cdf83a9c115e7bcf2e96f0cb75238ee9f8df9011b6f52c80f75d20f5777e7e0a04054'
                    )

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
      echo "Verifying STT\'s checksum failed!" 1>&2
      exit 1
    fi

    # Download the CTC Decoder Wheel.
    local ctc_fname="coqui_stt_ctcdecoder-1.3.0-cp310-cp310-manylinux_2_24_x86_64.whl"
    local ctc_sum="020bc4556b7ca47fa5ffdf62028a82498c46b73edd18b5c577288b7f8ed8960becc72dc94d9b018c366ee4802a37abcf7b3eadebb06fa73633f808f90365839d"
    wget "$_src_base_url/$ctc_fname" -q -O "$srcdir/$ctc_fname"
    local ctc_sum_check=$(sha512sum "$ctc_fname" | awk '{print $1}')
    if [ ${ctc_sum_check} != "$ctc_sum" ]; then
      # Bail!
      echo "Verifying CTC Decoder\'s checksum failed!" 1>&2
      exit 1
    fi
  elif [ ${MACHINE_TYPE} == 'aarch64' ]; then
    # Download the STT Wheel.
    local stt_fname="stt-1.3.0-cp37-cp37m-linux_aarch64.whl"
    local stt_sum="6513a1a35cd74a14c4bd49ea5c47c619237bb4c463159d83d773439f7b0cdf83a9c115e7bcf2e96f0cb75238ee9f8df9011b6f52c80f75d20f5777e7e0a04054"
    wget "$_src_base_url/$stt_fname" -q -O "$srcdir/$stt_fname"
    local stt_sum_check=$(sha512sum "$stt_fname" | awk '{print $1}')
    if [ ${stt_sum_checkv} != "$stt_sum" ]; then
      # Bail!
      echo "Verifying STT\'s checksum failed!" 1>&2
      exit 1
    fi
  fi

  # Python bindings
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps stt-*.whl
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps coqui_stt_ctcdecoder-*.whl
}