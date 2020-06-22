# Maintainer: Benjamin Brown <brown.benjam@husky.neu.edu>
pkgname=deepspeech-bin
pkgver=0.7.4
pkgrel=1
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
_pc_sum='b156d5149268022deff5076d01c3965d8a17c791547e431126455a3ed8a4f210f716b1f46ee2b14be43f71c9e882cdc53630cdd36fe56f76eb9f14ac9100a7d5'
_pc_tflite_sum='744eb89c34522fa5a1c0c9c2ba75a9b048b0d2f8f3c254234ec729050a61bb492ecde0124fc1005e4b1206f79696cc6ab0467fea30b141d23a6c135fd156ea83'

# amd64
source_x86_64=("$_src_base_url/native_client.amd64.cpu.linux.tar.xz"
               "$_raw_base_url/native_client/deepspeech.h"
               "deepspeech.pc"
               "deepspeech-tflite.pc")
sha512sums_x86_64=('3943ec4cfc20464f5628f78186cef0c574880dd4d1b9fcb05469d6668a0f645906e675e3a2764e4815cce4f57902adbbdee12459531a10ed8a86dcd1ba9543f4'
                   "$_header_sum"
                   "$_pc_sum"
                   "$_pc_tflite_sum")

# armv7h
source_armv7h=("$_src_base_url/native_client.rpi3.cpu.linux.tar.xz"
               "$_raw_base_url/native_client/deepspeech.h"
               "deepspeech.pc")
sha512sums_armv7h=('70ef783e22dd9955fbdf3ba6343e41d216b76cc28dc4af9ad613dbc7b9f1942bb3f1175887c94f63a79580f9c940f0c6b60b6d8af9f3f4491a8ad3c5d8bd7cfc'
                   "$_header_sum"
                   "$_pc_sum")

# aarch64
source_aarch64=("$_src_base_url/native_client.arm64.cpu.linux.tar.xz"
                "$_raw_base_url/native_client/deepspeech.h"
                "deepspeech.pc")
sha512sums_aarch64=('87b080871a210e5361af276f62af05f52c178df7315ecc8c9d37d9189d4d539684688829b46e2c311bb2e9c8efac9f8d6d0d595a78899e4e96371f81957f814b'
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
    local tf_lib_sum="214cc1ced28bae99fcb4c08202ba9d48eeb66a922926ea7517b073726f16bd8f4d5fa711e801ea1db8527305e65a0d1ea72f65abf55d61a95ad26223469af7df"
    mkdir -p "$tf_dir"
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
