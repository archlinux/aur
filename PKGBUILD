# Maintainer: pullmoll
pkgname=ems-collector-git
pkgver=r300.20dbf38
pkgrel=6
pkgdesc="Buderus EMS heating control data collection daemon"
arch=(x86_64)
url="https://github.com/maniac103/ems-collector"
license=('GPL')
groups=()
depends=('boost') # 'mysql++'
makedepends=('git' 'boost') #'mysql++' #'mqtt_client_cpp=1.0.9'
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('mqtt-topic-fix.diff' 'mqtt-compilation-fix-for-asio.diff' 'boost-1.69.0-compilation-fix.diff' 'ems-collector.conf.sample' 'ems-collector.service')
noextract=()
md5sums=('fb19990d31dc019ef7c90a68706cdacf'
         '9366b3490583dc6915f687f7118fc31c'
         '3cebf9af4152f43377056effeea9999e'
         '2456a8bfe6034a2434945a2ae05808ad'
         'ac3dea26402c63bfcafd7ba7184e8cc9')

_gitroot=https://github.com/maniac103/ems-collector.git
_gitname=ems-collector
_gitroot_mqtt=https://github.com/redboltz/mqtt_client_cpp
_gitname_mqtt=mqtt_client_cpp

prepare() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  cd "$srcdir"
  msg "Connecting to GIT server...."
  if [[ -d "$_gitname_mqtt" ]]; then
    #cd "$_gitname_mqtt" && git pull origin
    msg "The local files are already v1.0.9."
  else
    git clone --branch v1.0.9 "$_gitroot_mqtt" "$_gitname_mqtt"
  fi

  msg "GIT checkout done or server timeout"
}

pkgver() {
   cd "$srcdir/$_gitname/collector"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/collector"

  # Patch for MQTT compilation fix with boost-libs=1.64.0, mqtt_cpp=1.07 #20 <https://github.com/maniac103/ems-collector/issues/20>
  patch -i $srcdir/mqtt-compilation-fix-for-asio.diff

  # Patch for removing leading slash in topic
  patch -i $srcdir/mqtt-topic-fix.diff

  # Patch for boost-1.69.0 compilation
  patch -i $srcdir/boost-1.69.0-compilation-fix.diff

  # Enable MySQL
#  sed -i 's/# SRCS += Database.cpp/SRCS += Database.cpp/g' Makefile
#  sed -i 's/# CFLAGS += -DHAVE_MYSQL -I\/usr\/include\/mysql/CFLAGS += -DHAVE_MYSQL -I\/usr\/include\/mysql/g' Makefile
#  sed -i 's/# LIBS += -lmysqlpp/LIBS += -lmysqlpp/g' Makefile

  # Enable MQTT
  sed -i 's/# CFLAGS += -I..\/..\/mqtt_client_cpp\/include -DMQTT_NO_TLS -DHAVE_MQTT/CFLAGS += -I..\/..\/mqtt_client_cpp\/include -DMQTT_NO_TLS -DHAVE_MQTT/g' Makefile
  sed -i 's/# SRCS += MqttAdapter.cpp/SRCS += MqttAdapter.cpp/g' Makefile

  # Enable raw read/write commands
  sed -i 's/# CFLAGS += -DHAVE_RAW_READWRITE_COMMAND/CFLAGS += -DHAVE_RAW_READWRITE_COMMAND/g' Makefile
  #
  # BUILD HERE
  #
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 collector/collectord $pkgdir/usr/bin/collectord
  install -Dm755 "$srcdir/ems-collector.service" "$pkgdir/usr/lib/systemd/system/ems-collector.service"
}

# vim:set ts=2 sw=2 et:
