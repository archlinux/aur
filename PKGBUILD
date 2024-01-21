pkgname=openal-hrtf
pkgver=1.0
pkgrel=2
arch=('any')
license=('custom')
pkgdesc="Generate HRTF datasets for OpenAL"
depends=('openal')
makedepends=('unzip' 'libmysofa' 'git')
url="https://wiki.archlinux.org/index.php/Gaming"
source=("openal-soft-1.23.1::git+https://github.com/kcat/openal-soft.git?#tag=1.23.1"
        'CIAIR.tar.gz::http://www.sp.m.is.nagoya-u.ac.jp/HRTF/archive/data02.tgz'
        'ftp://ftp.ircam.fr/pub/IRCAM/equipes/salles/listen/archive/SUBJECTS/IRC_1005.zip'
        'MIT_KEMAR.zip::http://sound.media.mit.edu/resources/KEMAR/full.zip'
        'http://sofacoustics.org/data/database/mit/mit_kemar_normal_pinna.sofa'
        'http://sofacoustics.org/data/database/scut/SCUT_KEMAR_radius_all.sofa')
sha256sums=('SKIP'
            '9ed522abbf34f5e3e049fc0371f597798fea3586d565daf6eea79884d9c9334c'
            '1c34116d4eeb02958d55f5e8803b593d05f1bc384e79ae1e447503f419929773'
            '3fb533f7af95a6c07944f31a2a1d9dca0c77ab525a44865fc508009efb692ef6'
            'e7035994f5fd754058424c061380ee92b1d5ed58fccef2887a4266916616acdf'
            '789cf1cbc03076e0cecb9b8a4b123e7bdef2333acd52513f3c26b65eb62923e9')
noextract=('CIAIR.tar.gz' 'IRC_1005.zip' 'MIT_KEMAR.zip')

prepare() {
  mkdir -p "$srcdir/"{CIAIR,IRC_1005,MIT_KEMAR,MIT_KEMAR_sofa,SCUT_KEMAR}
  tar -xf "$srcdir/CIAIR.tar.gz" -C "$srcdir/CIAIR" --skip-old-files
  unzip -n "$srcdir/IRC_1005.zip" -d "$srcdir/IRC_1005/IRC"
  unzip -n "$srcdir/MIT_KEMAR.zip" -d "$srcdir/MIT_KEMAR/MITfull"
  ln -sf "$srcdir/mit_kemar_normal_pinna.sofa" "$srcdir/MIT_KEMAR_sofa/mit_kemar_normal_pinna.sofa"
  ln -sf "$srcdir/SCUT_KEMAR_radius_all.sofa" "$srcdir/SCUT_KEMAR/SCUT_KEMAR_radius_all.sofa"
}

build() {
  tables_new=("MIT_KEMAR_sofa" "SCUT_KEMAR")
  for hrtftable in "${tables_new[@]}"; do
    cd $srcdir/$hrtftable
    makemhr -m -r44100 -i"$srcdir/openal-soft-1.23.1/utils/$hrtftable.def" -o$srcdir/$hrtftable-%r.mhr
    makemhr -m -r48000 -i"$srcdir/openal-soft-1.23.1/utils/$hrtftable.def" -o$srcdir/$hrtftable-%r.mhr
  done
  cd "$srcdir/openal-soft-1.23.1"
  git checkout 0eb18e97112c2d7b35fe11339175161740c8fae1
  tables_old=("CIAIR" "IRC_1005" "MIT_KEMAR")
  for hrtftable in "${tables_old[@]}"; do
    cd $srcdir/$hrtftable
    makemhr -m -r44100 -i"$srcdir/openal-soft-1.23.1/utils/$hrtftable.def" -o$srcdir/$hrtftable-%r.mhr
    makemhr -m -r48000 -i"$srcdir/openal-soft-1.23.1/utils/$hrtftable.def" -o$srcdir/$hrtftable-%r.mhr
  done
}

package() {
  cd "$srcdir/"
  for mhr in *.mhr; do
    install -m644 -D "$mhr" "$pkgdir/usr/share/openal/hrtf/$mhr"
  done
}
