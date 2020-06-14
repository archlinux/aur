# Maintainer: Benjamin Brown <brown.benjam@husky.neu.edu>
pkgname=deepspeech-bin
pkgver=0.7.3
pkgrel=2
pkgdesc="A TensorFlow implementation of Baidu's DeepSpeech architecture - C++ native client + devel files."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/mozilla/DeepSpeech"
license=('MPL2')
depends=('gcc-libs')
provides=('deepspeech')
conflicts=('deepspeech')

# Set all sources.
_src_base_url="https://github.com/mozilla/DeepSpeech/releases/download/v$pkgver"
_raw_base_url="https://raw.githubusercontent.com/mozilla/DeepSpeech/v$pkgver/"

# Reused checksums.
_header_sum='16563959019ce823249b1c8772528936f4aa61d89daa5a9a9544b37b95348f0c6fefa5836b7eb7d3b41eb90c1998fb94ccb9e9b02dec4f0df8f693efd706ec4f'
_pc_sum='40228c9459fa7643ee7d58993d9ff594b8b74e7153c1b21118fc9f37e5565c7f9a476a19b864c59f1b7059503d2cd82a24c54eaf494206a435e3d239a228fb17'
_pc_tflite_sum='9e03307012e376291406992e8a312351e8b86391b6e19c0900d5d1cbe942395c11201386b6b22f7663f8148088c9d558c9ca1d9e16e711e37d901272d209aa8e'

# amd64
source_x86_64=("$_src_base_url/native_client.amd64.cpu.linux.tar.xz"
               "$_raw_base_url/native_client/deepspeech.h"
               "deepspeech.pc"
               "deepspeech-tflite.pc")
sha512sums_x86_64=('a9a79cdddab861fe06ae595471b63af92f7b1c6b320948e1c9bf4bf707e484e22800c30144f068af80f14c748d840d4268fe0901bc4e4a4ba920734bdc312b07'
                   "$_header_sum"
                   "$_pc_sum"
                   "$_pc_tflite_sum")

# armv7h
source_armv7h=("$_src_base_url/native_client.rpi3.cpu.linux.tar.xz"
               "$_raw_base_url/native_client/deepspeech.h"
               "deepspeech.pc")
sha512sums_armv7h=('0871b9cf1d3b1298a3281d5e62fe70b5bb5e994dbf03402a90162ab54871658238b61b580c7f64d1b9e9eba6870b8153c60c2e7beca6914cb8322fc8baf5ca42'
                   "$_header_sum"
                   "$_pc_sum")

# aarch64
source_aarch64=("$_src_base_url/native_client.arm64.cpu.linux.tar.xz"
                "$_raw_base_url/native_client/deepspeech.h"
                "deepspeech.pc")
sha512sums_aarch64=('ada530a74adf023879a6312c67529f4119bb58b6edd55581a2be0333bfd88bb4130cbf23b423a744e5181ef871f07506856df7e24739d1f6b6dc29c64e465de8'
                    "$_header_sum"
                    "$_pc_sum")

package() {
  # Create installation directories.
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	mkdir -p "$pkgdir/usr/lib/pkgconfig"

  # Separately get a copy of the TFLite library.
  # Unfortunately, due to files having the same name, this cannot be done with the sources section.
  # Note: At this time, only x86_64 Linux has a prebuilt TFLite library.
  MACHINE_TYPE=`uname -m`
  if [ ${MACHINE_TYPE} == 'x86_64' ]; then
    # Download the TFLite version of DS.
    local nc_tflite_fname="native_client.amd64.tflite.linux.tar.xz"
    wget "$_src_base_url/$nc_tflite_fname" -q -O "$srcdir/$nc_tflite_fname"

    # Make a directory and extract the library.
    local tf_dir="$srcdir/tflite"
    local tf_lib_path="$tf_dir/libdeepspeech.so"
    local tf_lib_sum="0ffdf49d8be17b27c98d840b46f8241c6b9c11aedcbabdb3edbffef8c76720a8c1b3cf3ce27eca0a05800edf61fb9a4a6f55b5ac19ee2c7522ec74563ee7f656"
    mkdir "$tf_dir"
    tar -xvf "$srcdir/$nc_tflite_fname" -C "$tf_dir" --wildcards 'libdeepspeech.so'

    # Ensure the library's checksum is correct.
    local lib_sum_check=$(sha512sum "$tf_lib_path" | awk '{print $1}')
    if [ ${lib_sum_check} != "$tf_lib_sum" ]; then
      # Bail!
      echo "Verifying the TFLite library's checksum failed!" 1>&2
      exit 1
    fi

    # Copy and rename the TFLite library.
    install -Dm755 "$tf_lib_path" "$pkgdir/usr/lib/libdeepspeech-tflite.so.$pkgver"
    ln -s "/usr/lib/libdeepspeech-tflite.so.$pkgver" "$pkgdir/usr/lib/libdeepspeech-tflite.so"

    # Install the pkgconf file.
    install -Dm644 deepspeech-tflite.pc "$pkgdir/usr/lib/pkgconfig/deepspeech-tflite.pc"
  fi

  # Install files.
  install -Dm755 libdeepspeech.so "$pkgdir/usr/lib/libdeepspeech.so.$pkgver"
  ln -s "/usr/lib/libdeepspeech.so.$pkgver" "$pkgdir/usr/lib/libdeepspeech.so"
  install -Dm644 deepspeech.h "$pkgdir/usr/include"
  install -Dm644 deepspeech.pc "$pkgdir/usr/lib/pkgconfig/deepspeech.pc"
}
