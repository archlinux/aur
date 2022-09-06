# Contributor: Benjamin Brown <brown.benjam@northeastern.edu>
pkgname=deepspeech-bin
pkgver=0.9.3
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
_header_sum='42ed6c74fc8f2c6931ab9db09ee80fc3419ca4ed54896f7bc3dd5a447dea6c40'
_pc_sum='8eb2bcad4a65d918d5f592e5a22b89f712f5456e6d14397c9834a94a63a9057f'
_pc_tflite_sum='380a008fd426d9cb087a3239190e228bc8935efe954be7eeb95ebfe76c0e25d1'

# amd64
source_x86_64=(
  "$_src_base_url/native_client.amd64.cpu.linux.tar.xz"
  "$_src_base_url/native_client.amd64.tflite.linux.tar.xz"
  "$_raw_base_url/native_client/deepspeech.h"
  "deepspeech.pc"
  "deepspeech-tflite.pc"
)
noextract=("native_client.amd64.tflite.linux.tar.xz")
sha256sums_x86_64=(
  '57b9bbf772102e5c9cef0ad751c39c1cd08e04b8921a30a539b1b37caf7ec2e3'
  'a5dd52f07f77236d3f3593f22f6066ea3b445645b1e550c2806e835e83e71022'
  "$_header_sum"
  "$_pc_sum"
  "$_pc_tflite_sum"
)

# armv7h
source_armv7h=(
  "$_src_base_url/native_client.rpi3.cpu.linux.tar.xz"
  "$_raw_base_url/native_client/deepspeech.h"
  "deepspeech.pc"
)
sha256sums_armv7h=(
  'SKIP'
  "$_header_sum"
  "$_pc_sum"
)

# aarch64
source_aarch64=(
  "$_src_base_url/native_client.arm64.cpu.linux.tar.xz"
  "$_raw_base_url/native_client/deepspeech.h"
  "deepspeech.pc"
)
sha256sums_aarch64=(
  'SKIP'
  "$_header_sum"
  "$_pc_sum"
)

package() {
  # Create installation directories.
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include"
	mkdir -p "$pkgdir/usr/lib/pkgconfig"


  # Separately unpack the TFLite library.
  # Note: At this time, only x86_64 Linux has a prebuilt TFLite library.
  MACHINE_TYPE=`uname -m`
  if [ ${MACHINE_TYPE} == 'x86_64' ]; then
    local nc_tflite_fname="native_client.amd64.tflite.linux.tar.xz"

    # Make a directory and extract the library.
    local tf_dir="$srcdir/tflite"
    local tf_lib_path="$tf_dir/libdeepspeech.so"

    mkdir -p "$tf_dir"
    tar -xvf "$srcdir/$nc_tflite_fname" -C "$tf_dir" --wildcards 'libdeepspeech.so'

    # Copy and rename the TFLite library.
    install -Dm755 "$tf_lib_path" "$pkgdir/usr/lib/libdeepspeech-tflite.so.$pkgver"
    ln -s "/usr/lib/libdeepspeech-tflite.so.$pkgver" "$pkgdir/usr/lib/libdeepspeech-tflite.so"

    # Install the pkgconf file.
    install -Dm644 deepspeech-tflite.pc "$pkgdir/usr/lib/pkgconfig/deepspeech-tflite.pc"
  fi

  # Install files.
  install -Dm755 libdeepspeech.so "$pkgdir/usr/lib/libdeepspeech.so.$pkgver"
  ln -s "/usr/lib/libdeepspeech.so.$pkgver" "$pkgdir/usr/lib/libdeepspeech.so"
  install -Dm755 deepspeech "$pkgdir/usr/bin"
  install -Dm644 deepspeech.h "$pkgdir/usr/include"
  install -Dm644 deepspeech.pc "$pkgdir/usr/lib/pkgconfig/deepspeech.pc"
}
