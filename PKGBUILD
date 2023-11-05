# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: CrocoDuck <crocoduck dot oducks at gmail dot com>
# Contributor: Haskellfant <moritz.kiefer@purelyfunctional.org

_pkgname=zam-plugins
pkgname=$_pkgname-git
pkgver=4.2.r0.g19307a5
pkgrel=1
pkgdesc='Collection of LADSPA/LV2/VST/JACK audio plugins for high-quality processing (git version)'
arch=(x86_64)
url='https://github.com/zamaudio/zam-plugins'
license=(GPL2)
groups=(clap-plugins ladspa-plugins lv2-plugins pro-audio vst-plugins vst3-plugins)
depends=(gcc-libs glibc libglvnd libx11 libxcursor libxext libxrandr)
makedepends=(alsa-lib dbus gendesk git ladspa libsamplerate jack lv2 zita-convolver)
optdepends=(
  'clap-host: to load the CLAP format plugins'
  'jack: to run the standalone applications'
  'ladspa-host: to load the LADSPA format plugins'
  'lv2-host: to load the LV2 format plugins'
  'vst-host: to load the VST2 format plugins'
  'vst3-host: to load the VST3 format plugins'
)
provides=(
  $_pkgname
  $_pkgname-clap
  $_pkgname-ladspa
  $_pkgname-lv2
  $_pkgname-standalone
  $_pkgname-vst
  $_pkgname-vst3
)
conflicts=(
  $_pkgname
  zamplugins
  $_pkgname
  $_pkgname-clap
  $_pkgname-ladspa
  $_pkgname-lv2
  $_pkgname-standalone
  $_pkgname-vst
  $_pkgname-vst3
)
source=("$_pkgname::git+https://github.com/zamaudio/$_pkgname.git"
        'dpf::git+https://github.com/DISTRHO/DPF.git'
        'pugl::git+https://github.com/DISTRHO/pugl.git'
        'zam-plugins.directory'
        'zam-plugins.menu')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '99e66b26922172cd212914230a557108'
         '5be3eb16b1d91ae653af25c8dcddd70f')

_names=('zamaximx2' 'zamulticomp' 'zammulticompx2' 'zamautosat' 'zamcomp'
        'zamcompx2' 'zamdelay' 'zamdynamiceq' 'zameq2' 'zamgeq31' 'zamgate'
        'zamgatex2' 'zamgrains' 'zamheadx2' 'zamphono' 'zamtube' 'zamverb')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  git submodule init
  git submodule set-url dpf "$srcdir"/dpf
  git -c protocol.file.allow=always submodule update

  cd dpf
  git submodule init
  git submodule set-url dgl/src/pugl-upstream "$srcdir"/pugl
  git -c protocol.file.allow=always submodule update

  cd ..

  declare -A exec_names=(
    ["zamaximx2"]="ZaMaximX2"
    ["zamulticomp"]="ZaMultiComp"
    ["zamulticompx2"]="ZaMultiCompX2"
    ["zamautosat"]="ZamAutoSat"
    ["zamcomp"]="ZamComp"
    ["zamcompx2"]="ZamCompX2"
    ["zamdelay"]="ZamDelay"
    ["zamdynamiceq"]="ZamDynamicEQ"
    ["zameq2"]="ZamEQ2"
    ["zamgeq31"]="ZamGEQ31"
    ["zamgate"]="ZamGate"
    ["zamgatex2"]="ZamGateX2"
    ["zamgrains"]="ZamGrains"
    ["zamheadx2"]="ZamHeadX2"
    ["zamphono"]="ZamPhono"
    ["zamtube"]="ZamTube"
    ["zamverb"]="ZamVerb"
  )
  declare -A comments=(
    ["zamaximx2"]="Acts as a brickwall limiter for mastering in its default state, but can also be tweaked to raise the average level as a stereo maximizer without ever clipping"
    ["zamulticomp"]="Mono multiband compressor, with 3 adjustable bands."
    ["zamulticompx2"]="Stereo version of ZaMultiComp, with individual threshold controls for each band and real-time visualisation of comp curves."
    ["zamautosat"]="An automatic saturation plugin, has been known to provide smooth levelling to live mic channels."
    ["zamcomp"]="A powerful mono compressor strip"
    ["zamcompx2"]="Stereo version of ZamComp with knee slew control"
    ["zamdelay"]="A simple feedback delay unit with sync-to-host BPM feature and filter."
    ["zamdynamiceq"]="A dynamic equalizer that changes its gain based on detecting a narrow band of frequencies."
    ["zameq2"]="Two band parametric equaliser with high and low shelving circuits."
    ["zamgeq31"]="31 band graphic equaliser, good for eq of live spaces, removing unwanted noise from a track etc."
    ["zamgate"]="Gate plugin for ducking low gain sounds."
    ["zamgatex2"]="Gate plugin for ducking low gain sounds, stereo version."
    ["zamgrains"]="Granular Synthesizer"
    ["zamheadx2"]="HRTF acoustic filtering plugin for directional sound."
    ["zamphono"]="A collection of phono filters for restoring vinyl records, or preparing to cut new ones."
    ["zamtube"]="Wave digital filter physical model of a triode tube amplifier stage, with modelled tone stacks from real guitar amplifiers"
    ["zamverb"]="Reverb"
  )
  declare -A generic=(
    ["zamaximx2"]="Maximizer and brickwall limiter"
    ["zamulticomp"]="Mono Multiband Compressor"
    ["zamulticompx2"]="Stereo Multiband Compressor"
    ["zamautosat"]="Automatic Saturation"
    ["zamcomp"]="Mono Compressor"
    ["zamcompx2"]="Stereo Compressor"
    ["zamdelay"]="Delay"
    ["zamdynamiceq"]="Dynamic Equalizer"
    ["zameq2"]="2 Band Parametric Equalizer"
    ["zamgeq31"]="31 Band Graphic Equalizer"
    ["zamgate"]="Mono Gate"
    ["zamgatex2"]="Stereo Gate"
    ["zamgrains"]="Granular Synthesizer"
    ["zamheadx2"]="HRTF Acoustic Filtering"
    ["zamphono"]="Phono Filters"
    ["zamtube"]="Tube Amplifier"
    ["zamverb"]="Reverb"
  )
  for name in "${_names[@]}"; do
    gendesk -f -n \
      --pkgname "com.zamaudio.$name" \
      --name "$name" \
      --exec "${exec_names[$name]}" \
      --pkgdesc "${comments[$name]}" \
      --genericname "${generic[$name]}"
  done
}

build() {
  cd $_pkgname
  export HAVE_ZITA_CONVOLVER=true
  make
}

package() {
  depends+=(libasound.so libdbus-1.so libGL.so libsamplerate.so libzita-convolver.so)
  cd $_pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr install
  # XDG desktop integration
  install -vDm 644 *.desktop \
    -t "$pkgdir"/usr/share/applications
  install -vDm 644 "$srcdir"/$_pkgname.menu \
    -t "$pkgdir"/etc/xdg/menus/applications-merged/
  install -vDm 644 "$srcdir"/$_pkgname.directory \
    -t "$pkgdir"/usr/share/desktop-directories
  # docs
  install -vDm644 README.md changelog \
    -t "$pkgdir"/usr/share/doc/$pkgname
}
