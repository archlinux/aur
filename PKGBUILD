# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: CrocoDuck <crocoduck dot oducks at gmail dot com>
# Contributor: Haskellfant <moritz.kiefer@purelyfunctional.org

_pkgname=zam-plugins
pkgname=$_pkgname-git
pkgver=4.4.r0.g6a7fd03
pkgrel=1
pkgdesc='Collection of multi-format audio plugins for high-quality processing (git version)'
arch=(x86_64)
url='https://github.com/zamaudio/zam-plugins'
license=(GPL-2.0-or-later)
groups=(clap-plugins ladspa-plugins lv2-plugins pro-audio vst-plugins vst3-plugins)
depends=(gcc-libs glibc libglvnd libx11 libxcursor libxext libxrandr)
makedepends=(dbus fftw  gendesk git ladspa libsamplerate jack lv2 zita-convolver)
checkdepends=(kxstudio-lv2-extensions lv2 lv2lint)
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
        'zamnoise-category.patch'
        'zam-plugins.directory'
        'zam-plugins.menu')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'd8c3f4e1ae5cef95fa9c5da115560c59d5c226b27b76bba086205f3e51766b9c'
            '057cd038c778a5121938160f1920112b9203615d8a706547c19b5f27e69230b8'
            '62e4f6aa7c50ce6561d56a797e184d4eab56546f203607df52b2aa4ac940667f')

declare -ga _names=(zamaximx2 zamulticomp zamulticompx2 zamautosat zamcomp zamcompx2
  zamdelay zamdynamiceq zameq2 zamgeq31 zamgate zamgatex2 zamgrains
  zamheadx2 zamnoise zamphono zamtube zamverb)

declare -gA _pretty_names=(
  [zamautosat]=ZamAutoSat
  [zamaximx2]=ZaMaximX2
  [zamcompx2]=ZamCompX2
  [zamcomp]=ZamComp
  [zamdelay]=ZamDelay
  [zamdynamiceq]=ZamDynamicEQ
  [zameq2]=ZamEQ2
  [zamgatex2]=ZamGateX2
  [zamgate]=ZamGate
  [zamgeq31]=ZamGEQ31
  [zamgrains]=ZamGrains
  [zamheadx2]=ZamHeadX2
  [zamnoise]=ZamNoise
  [zamphono]=ZamPhono
  [zampiano]=ZamPiano
  [zamtube]=ZamTube
  [zamulticompx2]=ZaMultiCompX2
  [zamulticomp]=ZaMultiComp
  [zamverb]=ZamVerb
)

declare -gA _comments=(
  [zamautosat]="An automatic saturation plugin, has been known to provide smooth levelling to live mic channels."
  [zamaximx2]="Acts as a brickwall limiter for mastering in its default state, but can also be tweaked to raise the average level as a stereo maximizer without ever clipping."
  [zamcomp]="A powerful mono compressor strip."
  [zamcompx2]="Stereo version of ZamComp with knee slew control."
  [zamdelay]="A simple feedback delay unit with sync-to-host BPM feature and filter."
  [zamdynamiceq]="A dynamic equalizer that changes its gain based on detecting a narrow band of frequencies."
  [zameq2]="A two band parametric equaliser with high and low shelving circuits."
  [zamgate]="A gate plugin for ducking low gain sounds."
  [zamgatex2]="Gate plugin for ducking low gain sounds, stereo version."
  [zamgeq31]="31 band graphic equaliser, good for eq of live spaces, removing unwanted noise from a track etc."
  [zamgrains]="A granular delay plugin."
  [zamheadx2]="HRTF acoustic filtering plugin for directional sound."
  [zamnoise]="A noise detection and removal plugin."
  [zamphono]="A collection of phono filters for restoring vinyl records, or preparing to cut new ones."
  [zamtube]="Wave digital filter physical model of a triode tube amplifier stage, with modelled tone stacks from real guitar amplifiers"
  [zamulticomp]="A mono multiband compressor, with 3 adjustable bands."
  [zamulticompx2]="Stereo version of ZaMultiComp, with individual threshold controls for each band and real-time visualisation of comp curves."
  [zamverb]="A convolution reverb with built-in preset impulse responses."
)

declare -gA _generic=(
  [zamautosat]="Automatic Saturation"
  [zamaximx2]="Maximizer and brickwall limiter"
  [zamcomp]="Mono Compressor"
  [zamcompx2]="Stereo Compressor"
  [zamdelay]="Delay"
  [zamdynamiceq]="Dynamic Equalizer"
  [zameq2]="2 Band Parametric Equalizer"
  [zamgate]="Mono Gate"
  [zamgatex2]="Stereo Gate"
  [zamgeq31]="31 Band Graphic Equalizer"
  [zamgrains]="Granular Synthesizer"
  [zamheadx2]="HRTF Acoustic Filtering"
  [zamnoise]="Noise Removal"
  [zamphono]="Phono Filters"
  [zamtube]="Tube Amplifier"
  [zamulticomp]="Mono Multiband Compressor"
  [zamulticompx2]="Stereo Multiband Compressor"
  [zamverb]="Reverb"
)

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
  patch -p1 -N -r - -i "$srcdir"/zamnoise-category.patch || true

  for name in "${_names[@]}"; do
    gendesk -f -n \
      --pkgname "com.zamaudio.$name" \
      --name "${_pretty_names[$name]}" \
      --exec "${_pretty_names[$name]}" \
      --pkgdesc "${_comments[$name]}" \
      --genericname "${_generic[$name]}"
  done
}

build() {
  cd $_pkgname
  export HAVE_ZITA_CONVOLVER=true
  make SKIP_NATIVE_AUDIO_FALLBACK=true
}

check() {
  cd $_pkgname

  local lv2specs=(
    atom buf-size core data-access dynmanifest event instance-access log midi
    morph options parameters patch port-groups port-props resize-port schemas
    state time ui units uri-map urid worker kx-programs kx-properties)

  mkdir -p .lv2

  for spec in ${lv2specs[@]}; do
    ln -vsf /usr/lib/lv2/$spec.lv2 .lv2
  done

  for name in "${_names[@]}"; do
    echo "Checking ${_pretty_names[$name]} ($name) with lv2lint ..."
    ln -vsf "../bin/${_pretty_names[$name]}.lv2" .lv2
    LV2_PATH="${PWD}/.lv2" lv2lint -s lv2_generate_ttl "urn:zamaudio:${_pretty_names[$name]}"
  done
}

package() {
  depends+=(libdbus-1.so libfftw3f.so libGL.so libsamplerate.so
            libzita-convolver.so)
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
