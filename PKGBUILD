# Maintainer: Miguel Barrio Orsikowsky <megamik79@protonmail.com>

pkgname=(lsp-plugins-noicons)
pkgver=1.2.1
pkgrel=1
pkgdesc="Collection of free plugins compatible with LADSPA, LV2 and LinuxVST (without XDG icons)"
arch=(x86_64)
url="https://lsp-plug.in"
license=(LGPL3)
makedepends=(cairo gcc-libs glibc hicolor-icon-theme libglvnd libx11 jack ladspa libsndfile lv2 php)
checkdepends=(lv2lint)
provides=(lsp-plugins)
conflicts=(lsp-plugins)
source=(https://github.com/sadko4u/${pkgname%-noicons}/releases/download/$pkgver/${pkgname%-noicons}-src-$pkgver.tar.gz)
sha512sums=('7246d60cd34313aa05a9167218d84cfd7a8d839520de44d1cb52e9da4df25a3f76a4cc1af17b5914532f0aa7227071e9b0cc4d9b87cab57d77feb759f26bd461')
b2sums=('d07f0bb6b5ce2ddc40ebdd56bc0270ea4d439d728051a9e39312ecb104efe4c961d7a2389fcd2869aa2503b403641db0e8f07eee5796e96887a37cb13878198e')

build() {
  make config VERBOSE=1 FEATURES='lv2 vst2 jack ladspa' PREFIX=/usr -C ${pkgname%-noicons}
  make VERBOSE=1 -C ${pkgname%-noicons}
}

check() {
  local _plugin
  local _lv2_uri="http://lsp-plug.in/plugins/lv2/"
  local _lv2_plugins=(art_delay_mono art_delay_stereo comp_delay_mono
  comp_delay_stereo comp_delay_x2_stereo compressor_lr compressor_mono
  compressor_ms compressor_stereo crossover_lr crossover_mono crossover_ms
  crossover_stereo dyna_processor_lr dyna_processor_mono dyna_processor_ms
  dyna_processor_stereo expander_lr expander_mono expander_ms expander_stereo
  gate_lr gate_mono gate_ms gate_stereo graph_equalizer_x16_lr
  graph_equalizer_x16_mono graph_equalizer_x16_ms graph_equalizer_x16_stereo
  graph_equalizer_x32_lr graph_equalizer_x32_mono graph_equalizer_x32_ms
  graph_equalizer_x32_stereo impulse_responses_mono impulse_responses_stereo
  impulse_reverb_mono impulse_reverb_stereo latency_meter limiter_mono
  limiter_stereo loud_comp_mono loud_comp_stereo mb_compressor_lr
  mb_compressor_mono mb_compressor_ms mb_compressor_stereo mb_expander_lr
  mb_expander_mono mb_expander_ms mb_expander_stereo mb_gate_lr mb_gate_mono
  mb_gate_ms mb_gate_stereo multisampler_x12 multisampler_x12_do
  multisampler_x24 multisampler_x24_do multisampler_x48 multisampler_x48_do
  oscillator_mono oscilloscope_x1 oscilloscope_x2 oscilloscope_x4
  para_equalizer_x16_lr para_equalizer_x16_mono para_equalizer_x16_ms
  para_equalizer_x16_stereo para_equalizer_x32_lr para_equalizer_x32_mono
  para_equalizer_x32_ms para_equalizer_x32_stereo phase_detector profiler_mono
  profiler_stereo room_builder_mono room_builder_stereo sampler_mono
  sampler_stereo sc_compressor_lr sc_compressor_mono sc_compressor_ms
  sc_compressor_stereo sc_dyna_processor_lr sc_dyna_processor_mono
  sc_dyna_processor_ms sc_dyna_processor_stereo sc_expander_lr sc_expander_mono
  sc_expander_ms sc_expander_stereo sc_gate_lr sc_gate_mono sc_gate_ms
  sc_gate_stereo sc_limiter_mono sc_limiter_stereo sc_mb_compressor_lr
  sc_mb_compressor_mono sc_mb_compressor_ms sc_mb_compressor_stereo
  sc_mb_expander_lr sc_mb_expander_mono sc_mb_expander_ms sc_mb_expander_stereo
  sc_mb_gate_lr sc_mb_gate_mono sc_mb_gate_ms sc_mb_gate_stereo slap_delay_mono
  slap_delay_stereo spectrum_analyzer_x1 spectrum_analyzer_x12
  spectrum_analyzer_x16 spectrum_analyzer_x2 spectrum_analyzer_x4
  spectrum_analyzer_x8 surge_filter_mono surge_filter_stereo trigger_midi_mono
  trigger_midi_stereo trigger_mono trigger_stereo)

  make FEATURES=lv2 DESTDIR="$PWD/test" install -C ${pkgname%-noicons}
  for _plugin in "${_lv2_plugins[@]}"; do
    lv2lint -Mpack -I "$PWD/test/usr/lib/lv2/${pkgname%-noicons}.lv2/" $_lv2_uri$_plugin
  done
}

package() {
  groups=(ladspa-plugins lv2-plugins pro-audio vst-plugins)
  depends=(cairo gcc-libs glibc hicolor-icon-theme libglvnd libsndfile.so libx11)
  optdepends=(
    'jack: for standalone applications'
    'ladspa-host: for LADSPA plugins'
    'lsp-plugins-docs: for documentation'
    'lv2-host: for LV2 plugins'
    'vst-host: for VST plugins'
  )

  make PREFIX=/usr DESTDIR="$pkgdir" install -C ${pkgname%-noicons}
}
