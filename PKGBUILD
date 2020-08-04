# Maintainer: Benjamin Brown <brown.benjam@northeastern.edu>
pkgname=deepspeech-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="A TensorFlow implementation of Baidu's DeepSpeech architecture - C++ native client + devel files."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/mozilla/DeepSpeech"
license=('MPL2')
depends=('gcc-libs')
makedepends=('wget' 'tar')
provides=('deepspeech')
conflicts=('deepspeech')

# Set all sources.
_src_base_url="https://github.com/mozilla/DeepSpeech/releases/download/v$pkgver"
_raw_base_url="https://raw.githubusercontent.com/mozilla/DeepSpeech/v$pkgver/"

# Reused checksums.
_header_sum='16563959019ce823249b1c8772528936f4aa61d89daa5a9a9544b37b95348f0c6fefa5836b7eb7d3b41eb90c1998fb94ccb9e9b02dec4f0df8f693efd706ec4f'
_pc_sum='caf2820f4d6a4fe7a9b9b035eee76700a5b90eb4c25242da6265934024a7bb669d541b05521a16d2792b1373f9ba6d3aa92fb9487c2def0a843d9fb74ce8db17'
_pc_tflite_sum='34bbee9149d2a7545e797c8a5858b267c9c7aed00762e88c6098c9cbb7d6a7eb346a930b6c64a34e191ced1e1bf76f1ea91b357169101058bab0f0adb057f44d'

# amd64
source_x86_64=("$_src_base_url/native_client.amd64.cpu.linux.tar.xz"
               "$_raw_base_url/native_client/deepspeech.h"
               "deepspeech.pc"
               "deepspeech-tflite.pc")
sha512sums_x86_64=('866c54d48ce260f62aeade4d0776f536245e5405b405f1e75f3d82cce286771ac2cab2dc8c0bdddbdb9fe1f092dc08007390d72f58c54b239b43f3b3084e6177'
                   "$_header_sum"
                   "$_pc_sum"
                   "$_pc_tflite_sum")

# armv7h
source_armv7h=("$_src_base_url/native_client.rpi3.cpu.linux.tar.xz"
               "$_raw_base_url/native_client/deepspeech.h"
               "deepspeech.pc")
sha512sums_armv7h=('d820ffde8493f8bfa560da79ad4362dce2777f82e8d519a16529b2c6c2bb824071772e3071e8d4d0ee93ab76e32c2e5755ca473e5a8ff10491d7da5d294b1d77'
                   "$_header_sum"
                   "$_pc_sum")

# aarch64
source_aarch64=("$_src_base_url/native_client.arm64.cpu.linux.tar.xz"
                "$_raw_base_url/native_client/deepspeech.h"
                "deepspeech.pc")
sha512sums_aarch64=('32261e9bda72c53a345acf4541d73e86dd68be587cf2f7e90e1705a68f4e501907c5f144539d7644db72f9784ba035dad9de184db4880f10f0d676a5935d85d3'
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
    local tf_lib_sum="7010cf23eb16da1edcd059ff599296a614171fca94f21dbd6de27935a2e72da557333b5560dacc4869a8fe4989a85608b685c2e20dbc8301d7b5f0ad20e06c98"
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
