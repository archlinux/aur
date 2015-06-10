# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Thomas Karmann <thomas@karmann-paf.de>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=cheesetracker
pkgver=0.9.15.4
pkgrel=8
pkgdesc='Software sampler and step-based sequencer. Impulse Tracker clone.'
arch=('x86_64' 'i686')
url='http://cheesetracker.sourceforge.net/'
license=('GPL')
depends=('libsigc++' 'qt4' 'jack' 'audiofile')
makedepends=('addinclude' 'scons' 'clang')
source=("http://sourceforge.net/projects/cheesetracker/files/cheesetracker/cheesetracker-0.9.15.4/cheesetracker-0.9.15.4.tar.bz2"
        'SConstruct'
        'detect.py')
sha256sums=('444cee4ee53c72ade6d109c263beac7f36c186bc22cd7ce5f86b095da60e0a02'
            '031bd83d47b3d8665459952234aab58f379b30bf17611dda970c5b9b00e6f800'
            '7224dc83b3eea66a5c85776d5c6db17b16e71576dee66ab1a07a506923659ef0')

prepare() {
  cd "$pkgname-$pkgver"

  # Adding missing includes
  addinclude cheesetracker/trackercore/player_data.h stdlib
  addinclude cheesetracker/trackercore/voice_control.h stdlib
  addinclude cheesetracker/loaders/loader_it.h stdlib
  addinclude cheesetracker/loaders/loader_s3m.h stdlib
  addinclude common/interface__QT/helpers/property_bridge_edit.h stdlib
  addinclude common/os/path_data.h stdlib
  addinclude common/drivers/posix/mutex_lock_pthreads.h stdlib
  addinclude common/drivers/posix/sound_driver_oss.h stdlib
  addinclude cheesetracker/trackercore/file_writer.h string
  addinclude cheesetracker/trackercore/instrument.h string
  addinclude common/plugins/effects/custom/effect_stereo_fx.h string
  addinclude common/plugins/effects/custom/chorus_effect.h string
  addinclude common/plugins/effects/custom/effect_pshift.h string
  addinclude common/plugins/effects/ladspa/ladspa_effect.h string
  addinclude common/components/audio/mixer.h string
  addinclude common/components/file/file_access.h string
  addinclude common/components/data/dds.h string
  addinclude common/components/data/property_bridges.h string
  addinclude common/components/audio/sample_data.h stddef

  # Fix the "cannot take address of temporary" error
  sed -i 's/set_property_bridge_list_data(controls,&new_fx->get_property_list());/list<Property_Bridge*> tmp = new_fx->get_property_list(); set_property_bridge_list_data(controls, \&tmp);/g' common/components/audio/dds_helpers.cpp

  # Make scons detect Qt4
  cp -vf ../SConstruct SConstruct
  cp -vf ../detect.py detect.py

  # Convert project to Qt4
  qt3to4-qt4 -alwaysOverwrite cheesetracker/interface__QT/*
  for dir in common/interface__QT/*; do
    qt3to4-qt4 -alwaysOverwrite "$dir"/*
  done

  # Use libsigc++2.0 instead of 1.2
  find . -name "*.h" -print -o -name "*.cpp" -print | xargs sed -i 's/SigC/sigc/g'
  find . -name "*.h" -print -o -name "*.cpp" -print | xargs sed -i 's/sigc::Signal/sigc::signal/g'
  find . -name "*.h" -print -o -name "*.cpp" -print | xargs sed -i 's/sigc::Connection/sigc::connection/g'
  # Should it be sigc::signal_base or another class?
  find . -name "*.h" -print -o -name "*.cpp" -print | xargs sed -i 's/sigc::Object/sigc::signal_base/g'
}

build() {
  cd "$pkgname-$pkgver"

  # Better error messages with clang
  export CXX="clang -ferror-limit=1"

  # Compile
  scons
}

package() {
  cd "$pkgname-$pkgver"

  scons install prefix="$pkgdir/usr"
}
# vim:set ts=2 sw=2 et:
