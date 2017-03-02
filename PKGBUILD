# Maintainer: Haralds Ulmanis <ezh@evilezh.net>
pkgname=apache-aurora
pkgver=0.17.0
pkgrel=3
pkgdesc="Aurora scheduler for mesos"
arch=('x86_64')
url=http://aurora.apache.org/
license=('Apache')
groups=('science')

depends=('mesos>=1.1.0-2' 'python2' 'java-environment' )
makedepends=('mesos>=1.1.0-2' 'patch' 'python2' 'java-environment' )

source=("http://www.apache.org/dist/aurora/$pkgver/$pkgname-${pkgver}.tar.gz"
  "aurora.service"
  "thermos.service"
  "aurora-env.sh"
  "aurora-startup.sh"
  "thermos-env.sh"
  "thermos-startup.sh")

sha512sums=('1fb01dbd8c66fd99fc151ea5d265fd518b5807014099567ab6440553d66f344830a4a30d4ab8d00e13189fa83d38260abea6ada82acf4d490b72afa9e71b5c94'
            '7f7978d979cddd87bd1c494f4e452ff5388b51d9f2bb7a7aa100ab14ac10ca3639e2f52b930680c9cd70e4f9dc34a82c84ce765ee3a8fbd3ee8f32804c6ec4f2'
            '81e042940d9b6269b2a2a1258e32c6c7d3216c3174dfa3210a27b075b96f5dedfd2a06cd5e91bd8cc658985605d392283adde79d96aab8ae8c593aa20be7db75'
            'ac99a7ab12a6c92ea7ad325c462ff6abd74be1ad6996d997f9e69cd2435c839c731efebda8895b770c1a2316343a01e0851c5f1e6176b4eb7897e8e1fbece096'
            '56a24cc5a4144deb4ce4ee9c5fa65a299dfc7c941aa3a155abdc22f1563d488b9ee4997e13f97b7f9e5b512fc7a391f0901279a4b1f4ec814aa39dfc5287a7f8'
            '8553d5bde35c706e03c209963b3348a4b0e049e35d646079b7284f43b76de8db535ecd1be632726bc27f24e410fcf1962301de3798ef8958659ae4389d2f4113'
            '861ce88a1261864e8b56130268cf73003ccb2bac1e1bc7ed699b30caee671775b5eef68e014068921e667091ad2e81c8369c6a9ded1c6bbfe2247fd071741138')

prepare() {
   build_dir="$srcdir/$pkgname-$pkgver"
   cd "$build_dir/3rdparty/python"
   patch < "${srcdir}/../3rdparty-build.patch"
   cd "$build_dir"
   wget https://services.gradle.org/distributions/gradle-3.1-bin.zip
   unzip gradle-3.1-bin.zip
   rm gradle-3.1-bin.zip
  if [ ! -d build ]; then
    mkdir build
  fi
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./gradle-3.1/bin/gradle installDist
  ./pants binary src/main/python/apache/aurora/kerberos:kaurora
  ./pants binary src/main/python/apache/aurora/kerberos:kaurora_admin
  ./pants binary src/main/python/apache/aurora/executor:thermos_executor
  ./pants binary src/main/python/apache/aurora/tools:thermos
  ./pants binary src/main/python/apache/aurora/tools:thermos_observer
  ./pants binary src/main/python/apache/thermos/runner:thermos_runner
  build-support/embed_runner_in_executor.py
}

check() {
  msg "Skipping 'check'."
}

package() {
  build_dir="$srcdir/$pkgname-$pkgver"
  lib_dir="$pkgdir/usr/lib/$pkgname"

  mkdir -p $lib_dir
  cp -r $build_dir/dist/install/aurora-scheduler/* $lib_dir
  mkdir -p -m755 $pkgdir/usr/bin
  install -m755 $build_dir/dist/kaurora_admin.pex $pkgdir/usr/bin/aurora_admin
  install -m755 $build_dir/dist/kaurora.pex $pkgdir/usr/bin/aurora
  install -m755 $build_dir/dist/thermos_executor.pex $pkgdir/usr/bin/thermos_executor
  install -m755 $build_dir/dist/thermos_observer.pex $pkgdir/usr/bin/thermos_observer
  install -m755 $build_dir/dist/thermos.pex $pkgdir/usr/bin/thermos
  install -m755 $build_dir/dist/thermos_runner.pex $pkgdir/usr/bin/thermos_runner

  mkdir -p -m755 $pkgdir/etc/aurora
  install -m755 aurora-startup.sh $pkgdir/usr/bin/aurora-startup.sh
  install -m755 thermos-startup.sh $pkgdir/usr/bin/thermos-startup.sh
  install -m644 aurora-env.sh $pkgdir/etc/aurora/aurora-env.sh
  install -m644 thermos-env.sh $pkgdir/etc/aurora/thermos-env.sh
  mkdir -p -m755 $pkgdir/usr/lib/systemd/system
  install -m644 $srcdir/{aurora,thermos}.service $pkgdir/usr/lib/systemd/system
}
