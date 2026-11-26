# Maintainer: redxherring
# Release bumps (upstream tags every release):
#   1. Set pkgver to the new tag, without its leading v (archive v2.3.0.tar.gz -> 2.3.0)
#   2. Update sha256sums (run: updpkgsums)
#   3. Regenerate .SRCINFO (run: makepkg --printsrcinfo > .SRCINFO)
#   4. Build and test (run: makepkg -sf)
pkgname=radiance-inference
pkgver=2.2.0
pkgrel=1
pkgdesc="C++20 LLM inference server for AMD GPUs (primarily gfx1201) with OpenAI-compatible HTTP API (release)"
arch=('x86_64')
url="https://codeberg.org/StillDeadcode/radiance"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'ffmpeg' 'rocm-hip-runtime' 'openblas')
makedepends=('cmake' 'ninja' 'openblas' 'rocm-hip-sdk')
optdepends=('curl: hfget.sh model-download helper (/usr/libexec/radiance/hfget.sh)'
            'jq: hfget.sh'
            'python3: rad-export tool (/usr/bin/rad-export)')
# Same files as the live-HEAD build of this project; only one may be installed.
conflicts=('radiance-inference-git')
backup=('etc/radiance/radiance.yaml'
        'etc/radiance/radiance.env')
install=${pkgname}.install
options=('!lto' '!debug')
# Codeberg serves the tag snapshot; it extracts to ${srcdir}/radiance. No submodules
# and no FetchContent/file(DOWNLOAD) in CMakeLists.txt, so this build is the git build.
source=("https://codeberg.org/StillDeadcode/radiance/archive/v${pkgver}.tar.gz"
        radiance.service
        radiance.yaml
        radiance.env)
sha256sums=('d2298a3f90a8519746fcde25ee51fe1d0ad4fc5426783da11f6c6bba84c4ab26'
            'c903669f221faea09545b70525f780001d73648c66cfc472ac9b23df23956400'
            'f03e9c85f9540527b2d1a756238fb3dd25c1e4718c78b48eb0e0ef8b3313c9e5'
            'a0310c047f107a493c275e5e92b896785238f8dbcc5319efca86ac537885c3ac')

# Edit for other hardware: run `offload-arch`.
_hip_archs='gfx1201'

build() {
  cd "${srcdir}/radiance"
  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DRAD_WITH_HIP=ON \
    -DRAD_GPU_TARGETS="${_hip_archs}" \
    -DRAD_WITH_FFMPEG=ON \
    -DRAD_BUILD_TESTS=OFF \
    -DRAD_HIP_VOPD_REPEATABLE=OFF
  cmake --build build --parallel
}

package() {
  cd "${srcdir}/radiance"
  DESTDIR="${pkgdir}" cmake --install build
  # upstream install rules miss data/recipes/*.recipe (Dockerfile lines 204-205 replicate this)
  install -d "${pkgdir}/usr/share/radiance/recipes"
  install -m644 data/recipes/*.recipe -t "${pkgdir}/usr/share/radiance/recipes/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"

  install -Dm644 "${srcdir}/radiance.service" "${pkgdir}/usr/lib/systemd/system/radiance.service"
  # 2.0.0: the server reads all settings from radiance.yaml (CLI flags are refused).
  # The YAML ships 0644 - with server.api-key-env it carries no secret. radiance.env
  # is the single 0600 EnvironmentFile: the API key plus the optional engine knobs,
  # so it ships root-only: 0644 would leak the key to every local user. The unit has
  # no User= and PID 1 reads EnvironmentFile as root, so 0600 costs nothing. -D would
  # create /etc/radiance 0755; create it first at 0750 so the directory is not
  # traversable either.
  install -d -m750 "${pkgdir}/etc/radiance"
  install -Dm644 "${srcdir}/radiance.yaml"    "${pkgdir}/etc/radiance/radiance.yaml"
  install -Dm600 "${srcdir}/radiance.env"     "${pkgdir}/etc/radiance/radiance.env"
  # /srv/models/rad: our server.download-dir and upstream's model dir (README:77).
  # ReadWritePaths= needs it to exist (it does not create paths); hfget.sh mkdir -p's
  # below it. The service runs as root (no User=), so root:root; 0755 - published
  # weights are public and UMask=0077 makes fetched files root-only anyway.
  install -d -m755 "${pkgdir}/srv/models/rad"
}
