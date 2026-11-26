# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgbase=thinkmeta-concurrenttasks-samples-bin
pkgname=(ctdeflate-bin ctlame-bin ctopus-bin ctjpeg-bin)
pkgver=0.7.0
pkgrel=1
arch=('x86_64')
url="https://github.com/ThinkMeta-com/ThinkMeta.ConcurrentTasks.Samples"
license=('MIT')
depends=('glibc' 'thinkmeta-concurrenttasks-core')
checkdepends=('python')
options=('!strip' '!debug')
# These are upstream's prebuilt binaries, so nothing is compiled here; strip and
# debug stay off to keep the installed files identical to the bytes upstream
# publishes.
#
# Upstream tags the samples repository, never an individual encoder, so pkgver
# is that tag and the version each program reports (ctDeflate 0.1.4, ctLame
# 0.3.0, ctOpus 0.1.4, ctJpeg 0.1.3) is not a release of its own.
source=("samples-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3381032af63e70b2b4dce5f7b788e43c4648f3d07d66cb05de703066aa2bcddc')

_latestver() {
  gh api --paginate repos/ThinkMeta-com/ThinkMeta.ConcurrentTasks.Samples/tags --jq '.[].name' |
    sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}
latestver() { _latestver; }

check() {
  local top="${srcdir}/ThinkMeta.ConcurrentTasks.Samples-${pkgver}"
  local out="${srcdir}/check" avx2=no
  mkdir -p "${out}"
  grep -qw avx2 /proc/cpuinfo && avx2=yes

  python - "${out}" <<'PY'
import array, math, sys, wave

out = sys.argv[1]


def write_wav(path, rate, seconds=3):
    frames = array.array('h')
    for i in range(rate * seconds):
        left = int(9000 * math.sin(2 * math.pi * 440 * i / rate))
        right = int(9000 * math.sin(2 * math.pi * 660 * i / rate))
        frames.append(left)
        frames.append(right)
    with wave.open(path, 'wb') as f:
        f.setnchannels(2)
        f.setsampwidth(2)
        f.setframerate(rate)
        f.writeframes(frames.tobytes())


write_wav(out + '/in-44100.wav', 44100)
write_wav(out + '/in-48000.wav', 48000)

width, height = 320, 240
pixels = bytearray(b'P6\n%d %d\n255\n' % (width, height))
for y in range(height):
    for x in range(width):
        pixels += bytes((x * 255 // width, y * 255 // height, 128))
with open(out + '/in.ppm', 'wb') as f:
    f.write(pixels)
PY

  msg2 'ctDeflate against the libdeflate 1.26 oracle it ships'
  local deflate="${top}/ctDeflate/bin/linux-x64"
  cat "${top}/README.md" "${top}/ctDeflate/README.md" > "${out}/in.txt"
  # level 0 diverges from the oracle, 1..9 do not
  local level
  for level in 1 6 9; do
    "${deflate}/ctDeflate" "-${level}" -o "${out}/ct-${level}.gz" "${out}/in.txt" > /dev/null
    "${deflate}/gzip" "-${level}" -c "${out}/in.txt" > "${out}/oracle-${level}.gz"
    cmp "${out}/ct-${level}.gz" "${out}/oracle-${level}.gz"
  done

  msg2 'ctLame against the LAME 4.0 oracle it ships'
  local lame="${top}/ctLame/bin/linux-x64"
  "${lame}/ctLame" -V4 "${out}/in-44100.wav" "${out}/ct.mp3" > /dev/null
  "${lame}/lame" -V4 "${out}/in-44100.wav" "${out}/oracle.mp3" > /dev/null 2>&1
  cmp "${out}/ct.mp3" "${out}/oracle.mp3"

  msg2 'ctJpeg against the jpegli oracle it ships'
  local jpeg="${top}/ctJpeg/bin/linux-x64" simd=sse2
  [[ ${avx2} == yes ]] && simd=avx2
  "${jpeg}/ctJpeg" "${out}/in.ppm" "${out}/ct.jpg" -q 85 --simd "${simd}" > /dev/null
  "${jpeg}/cjpegli" --target "${simd}" -q 85 "${out}/in.ppm" "${out}/oracle.jpg" > /dev/null
  cmp "${out}/ct.jpg" "${out}/oracle.jpg"

  if [[ ${avx2} == yes ]]; then
    msg2 'ctOpus against the opusenc oracle it ships'
    local opus="${top}/ctOpus/bin/linux-x64"
    # opusenc picks a random Ogg serial per run unless pinned, which is why the
    # reference hashes upstream publishes are taken with a fixed one
    "${opus}/ctOpus" --quiet --serial 1 "${out}/in-48000.wav" "${out}/ct.opus"
    "${opus}/opusenc" --quiet --serial 1 "${out}/in-48000.wav" "${out}/oracle.opus"
    cmp "${out}/ct.opus" "${out}/oracle.opus"
  else
    warning 'ctOpus needs AVX2; skipped the comparison against its oracle'
  fi
}

_install_encoder() {
  local folder="${srcdir}/ThinkMeta.ConcurrentTasks.Samples-${pkgver}/$1"

  install -Dm755 "${folder}/bin/linux-x64/$1" "${pkgdir}/usr/bin/$1"
  # COPYING is the reference project's notice, which a ported binary has to carry
  # and which no package provides; LICENSE.txt is the MIT text of the port itself,
  # installed for the file scopes it adds on top of that licence.
  install -Dm644 "${folder}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "${folder}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  local notice
  for notice in "${folder}"/*LICENSE*.md "${folder}"/src/*LICENSE*.md; do
    if [[ -f ${notice} ]]; then
      install -Dm644 "${notice}" "${pkgdir}/usr/share/licenses/${pkgname}/${notice##*/}"
    fi
  done
}

package_ctdeflate-bin() {
  pkgdesc="Parallel deflate compressor, bit-identical to libdeflate 1.26 gzip"
  provides=("${pkgname%-bin}")
  conflicts=("${pkgname%-bin}")

  _install_encoder ctDeflate
}

package_ctlame-bin() {
  pkgdesc="Parallel MP3 encoder, bit-identical to LAME 4.0"
  # the ctLame binary is a derived work of LAME distributed under the Library GPL
  # version 2 or any later version, not under the MIT licence of this base
  license=('LGPL-2.0-or-later')
  provides=("${pkgname%-bin}")
  conflicts=("${pkgname%-bin}")

  _install_encoder ctLame
}

package_ctopus-bin() {
  pkgdesc="Parallel Opus encoder, bit-identical to opusenc"
  provides=("${pkgname%-bin}")
  conflicts=("${pkgname%-bin}")

  _install_encoder ctOpus
}

package_ctjpeg-bin() {
  pkgdesc="Parallel JPEG encoder, bit-identical to cjpegli"
  provides=("${pkgname%-bin}")
  conflicts=("${pkgname%-bin}")

  _install_encoder ctJpeg
}
