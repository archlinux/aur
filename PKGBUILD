pkgname=python-stt-bin 
_pkgname=STT
pkgver=1.4.0
pkgrel=1
pkgdesc="Coqui-STT - Python native client + CTC decoder."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/coqui-ai/STT"
license=('MPL2')
makedepends=('wget' 'tar')
provides=('python-stt')
conflicts=('python-stt')

# Set all sources.
_src_base_url="https://github.com/coqui-ai/STT/releases/download/v$pkgver"
_raw_base_url="https://raw.githubusercontent.com/coqui-ai/STT/v$pkgver"

# amd64
source_x86_64=("$_src_base_url/stt-${pkgver}-cp310-cp310-manylinux_2_24_x86_64.whl"
               "$_src_base_url/coqui_stt_ctcdecoder-${pkgver}-cp310-cp310-manylinux_2_24_x86_64.whl"
                )
sha512sums_x86_64=('ed90874b04964e5c76f45521137a51d663fbeda505c45b0a19d267538e1a0a2106dfbf968a2c411b566917417b0dcd70459fd03bb0502fa78c27585c579668f2'
                   '9f26ac886e1c7e62eeaeacf35f64121fdaa82e7f5edae08fe729a3985f10982dcef644a16858d2a62bfc78a10f819933854c2b191ec57bdb20a9a61a3728decb'
                    )

# armv7h
source_armv7h=("$_src_base_url/stt-${pkgver}-cp37-cp37m-linux_armv7l.whl"
               )
sha512sums_armv7h=('1d9811c71020e493be8070d82b5d73d5815a454a1b9d0381798f15b4ed1a39c5cd3381c944cb106089e62402f016d18b8066010d1d4462518ada09cdc421d274'
                   )

# aarch64
source_aarch64=("$_src_base_url/stt-${pkgver}-cp37-cp37m-linux_aarch64.whl"
               )
sha512sums_aarch64=('61062cfd914f48bc4c7c04867f5261a4c8800ed79b4519335d4f8ef672df0308b5fccd176849dcf23af412eb138bb71034f0b276f5f1f6ef9ea726d95bcb7c24'
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
    local stt_fname="stt-${pkgver}-cp310-cp310-manylinux_2_24_x86_64.whl"
    local stt_sum="ed90874b04964e5c76f45521137a51d663fbeda505c45b0a19d267538e1a0a2106dfbf968a2c411b566917417b0dcd70459fd03bb0502fa78c27585c579668f2"
    wget "$_src_base_url/$stt_fname" -q -O "$srcdir/$stt_fname"
    local stt_sum_check=$(sha512sum "$stt_fname" | awk '{print $1}')
    if [ ${stt_sum_checkv} != "$stt_sum" ]; then
      # Bail!
      echo "Verifying STT\'s checksum failed!" 1>&2
      exit 1
    fi

    # Download the CTC Decoder Wheel.
    local ctc_fname="coqui_stt_ctcdecoder-${pkgver}-cp310-cp310-manylinux_2_24_x86_64.whl"
    local ctc_sum="9f26ac886e1c7e62eeaeacf35f64121fdaa82e7f5edae08fe729a3985f10982dcef644a16858d2a62bfc78a10f819933854c2b191ec57bdb20a9a61a3728decb"
    wget "$_src_base_url/$ctc_fname" -q -O "$srcdir/$ctc_fname"
    local ctc_sum_check=$(sha512sum "$ctc_fname" | awk '{print $1}')
    if [ ${ctc_sum_check} != "$ctc_sum" ]; then
      # Bail!
      echo "Verifying CTC Decoder\'s checksum failed!" 1>&2
      exit 1
    fi
  elif [ ${MACHINE_TYPE} == 'armv7h' ]; then
    # Download the STT Wheel.
    local stt_fname="stt-${pkgver}-cp37-cp37m-linux_armv7l.whl"
    local stt_sum="1d9811c71020e493be8070d82b5d73d5815a454a1b9d0381798f15b4ed1a39c5cd3381c944cb106089e62402f016d18b8066010d1d4462518ada09cdc421d274"
    wget "$_src_base_url/$stt_fname" -q -O "$srcdir/$stt_fname"
    local stt_sum_check=$(sha512sum "$stt_fname" | awk '{print $1}')
    if [ "${stt_sum_checkv}" != "${stt_sum}" ]; then
      # Bail!
      echo "Verifying STT\'s checksum failed!" 1>&2
      exit 1
    fi
  elif [ ${MACHINE_TYPE} == 'aarch64' ]; then
    # Download the STT Wheel.
    local stt_fname="stt-${pkgver}-cp37-cp37m-linux_aarch64.whl"
    local stt_sum="61062cfd914f48bc4c7c04867f5261a4c8800ed79b4519335d4f8ef672df0308b5fccd176849dcf23af412eb138bb71034f0b276f5f1f6ef9ea726d95bcb7c24"
    wget "$_src_base_url/$stt_fname" -q -O "$srcdir/$stt_fname"
    local stt_sum_check=$(sha512sum "$stt_fname" | awk '{print $1}')
    if [ "${stt_sum_checkv}" != "${stt_sum}" ]; then
      # Bail!
      echo "Verifying STT\'s checksum failed!" 1>&2
      exit 1
    fi
  fi

  # Python bindings
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps stt-*.whl
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps coqui_stt_ctcdecoder-*.whl
}