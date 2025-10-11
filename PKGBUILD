# Maintainer: Geonho Kim <ghkim@muphix.com>
#
# PKGBUILD notes:
# - Based on upstream un-fonts 1.0.2 (080608).
# - Based on Debian's fonts-unfonts-core packaging.
#   - Fontconfig snippet for improved rendering
#   - fsType cleanup (SetOS2Value("FSType",0)) to ensure installable embedding
#     for GPL fonts.
#   - Wrong PostScript name fix (SetFontNames(""))
#     (UnDinaru-Bold -> UnDinaru-Light)
#
_pkgver_pre=1.0.2
_pkgver_post=080608
_source_file_pre=2607
_source_file="${_source_file_pre}-un-fonts-core-${_pkgver_pre}-${_pkgver_post}.tar.gz"

pkgname=ttf-unfonts-core
pkgver=${_pkgver_pre}.${_pkgver_post}
pkgrel=1
pkgdesc='Un series Korean TrueType fonts (core set)'
arch=('any')
url='https://kldp.net/unfonts/'
license=('GPL-2.0-only')
makedepends=('fontforge')
source=("${pkgname}-${pkgver}.tar.gz::https://kldp.net/unfonts/release/${_source_file}")
sha256sums=('3b0a7274f9aab7e8f0f1938c01a70e1581766d51b494ba145683f37ac557918e')

_ttfs=()
_fc='90-fonts-unfonts-core.conf'

prepare() {
  cd "$srcdir/un-fonts"

  mapfile -d '' _ttfs < <(find . -type f -iname '*.ttf' -print0)

  # Fix wrong PostScript name
  fontforge -lang=ff \
      -c 'Open($1); SetFontNames("UnDinaru-Light"); Generate($1)' \
          './UnDinaruLight.ttf'

  # Cleanup fsType in OS/2 table
  for i in "${_ttfs[@]}"; do
    fontforge -lang=ff -c 'Open($1); SetOS2Value("FSType",0); Generate($1)' "$i"
  done

  # Build fontconfig for improved rendering
  cat > "$_fc" <<'EOF'
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <!-- Un fonts have no hint instructions so they rely on autohint and
       antialias. Note that they might look horrible with some
       autohint configuration. -->
  <match target="font">
    <test name="family" qual="any">
      <string>UnBatang</string>
    </test>
    <edit name="antialias" mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hinting"   mode="assign" binding="strong"><bool>false</bool></edit>
    <edit name="autohint"  mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hintstyle" mode="assign" binding="strong"><const>hintslight</const></edit>
  </match>
  <match target="font">
    <test name="family" qual="any">
      <string>UnDotum</string>
    </test>
    <edit name="antialias" mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hinting"   mode="assign" binding="strong"><bool>false</bool></edit>
    <edit name="autohint"  mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hintstyle" mode="assign" binding="strong"><const>hintslight</const></edit>
  </match>
  <match target="font">
    <test name="family" qual="any">
      <string>UnGungseo</string>
    </test>
    <edit name="antialias" mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hinting"   mode="assign" binding="strong"><bool>false</bool></edit>
    <edit name="autohint"  mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hintstyle" mode="assign" binding="strong"><const>hintslight</const></edit>
  </match>
  <match target="font">
    <test name="family" qual="any">
      <string>UnPilgi</string>
    </test>
    <edit name="antialias" mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hinting"   mode="assign" binding="strong"><bool>false</bool></edit>
    <edit name="autohint"  mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hintstyle" mode="assign" binding="strong"><const>hintslight</const></edit>
  </match>
  <match target="font">
    <test name="family" qual="any">
      <string>UnGraphic</string>
    </test>
    <edit name="antialias" mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hinting"   mode="assign" binding="strong"><bool>false</bool></edit>
    <edit name="autohint"  mode="assign" binding="strong"><bool>true</bool></edit>
    <edit name="hintstyle" mode="assign" binding="strong"><const>hintslight</const></edit>
  </match>
</fontconfig>
EOF
}

package() {
  cd "$srcdir/un-fonts"

  mapfile -d '' _ttfs < <(find . -type f -iname '*.ttf' -print0)

  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" "${_ttfs[@]}"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" 'README'
  install -Dm644 -t "$pkgdir/usr/share/fontconfig/conf.avail/" "$_fc"
  install -d "$pkgdir/usr/share/fontconfig/conf.d/"
  ln -s "../conf.avail/$_fc" "$pkgdir/usr/share/fontconfig/conf.d/$_fc"
}
# vim:set ft=sh ts=2 sw=2 et:
