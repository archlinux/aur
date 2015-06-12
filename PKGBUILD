# Maintainer: David Roheim <david dot roheim at gmail dot com>
# Contributor: Manuel Hoffmann <manuel@manuel-hoffmann.info>
# Contributor: Markus Holtermann <aur@markusholtermann.eu>
# Contributor: Mantas Vidutis <mantas.a.vidutis-at-gmail.com>
# Contributor: Tianjiao Yin <ytj000@gmail.com>
#
# Check this file for alternative mirrors!
pkgname=('hadoop')
pkgver=2.7.0
pkgrel=2
pkgdesc="Hadoop - MapReduce implementation and distributed filesystem"
arch=('i686' 'x86_64')
url="http://hadoop.apache.org"
license=('apache')
depends=('java-environment' 'openssh' 'apache-ant' 'polkit')
install=${pkgname}.install
source=(
	#"http://www.eng.lsu.edu/mirrors/apache/hadoop/common/hadoop-$pkgver/hadoop-$pkgver.tar.gz"
	# "http://mirror3.layerjet.com/apache/hadoop/common/hadoop-$pkgver/hadoop-$pkgver.tar.gz"
	# "http://mirror.lwnetwork.org.uk/APACHE/hadoop/common/hadoop-$pkgver/hadoop-$pkgver.tar.gz"
	# "http://apache.openmirror.de/hadoop/common/hadoop-$pkgver/hadoop-$pkgver.tar.gz"
	# "http://mirror.serversupportforum.de/apache/hadoop/common/hadoop-$pkgver/hadoop-$pkgver.tar.gz"
	# "http://mirror.arcor-online.net/www.apache.org/hadoop/common/hadoop-$pkgver/hadoop-$pkgver.tar.gz"
	"http://ftp-stud.hs-esslingen.de/pub/Mirrors/ftp.apache.org/dist/hadoop/common/hadoop-$pkgver/hadoop-$pkgver.tar.gz"
	# "http://apache.imsam.info/hadoop/common/hadoop-$pkgver/hadoop-$pkgver.tar.gz"
	# "http://apache.lehtivihrea.org/hadoop/common/hadoop-$pkgver/hadoop-$pkgver.tar.gz"
	# "http://mirror.synyx.de/apache/hadoop/common/hadoop-$pkgver/hadoop-$pkgver.tar.gz"
	# "http://artfiles.org/apache.org/hadoop/common/hadoop-$pkgver/hadoop-$pkgver.tar.gz"
	# "http://apache.mirror.clusters.cc/hadoop/common/hadoop-$pkgver/hadoop-$pkgver.tar.gz"
	# "http://apache.mirror.digionline.de/hadoop/common/hadoop-$pkgver/hadoop-$pkgver.tar.gz"
	# "http://apache.lauf-forum.at/hadoop/common/hadoop-$pkgver/hadoop-$pkgver.tar.gz"
	# "http://ftp.halifax.rwth-aachen.de/apache/hadoop/common/hadoop-$pkgver/hadoop-$pkgver.tar.gz"
	# "http://mirror.netcologne.de/apache.org/hadoop/common/hadoop-$pkgver/hadoop-$pkgver.tar.gz"
	# "http://mirror.softaculous.com/apache/hadoop/common/hadoop-$pkgver/hadoop-$pkgver.tar.gz"
	# "http://mirror.derwebwolf.net/apache/hadoop/common/hadoop-$pkgver/hadoop-$pkgver.tar.gz"
        # "http://apache.spd.co.il/hadoop/common/hadoop-$pkgver/hadoop-$pkgver.tar.gz"
	#"http://apache.mirror.iphh.net/hadoop/common/hadoop-$pkgver/hadoop-$pkgver.tar.gz"
	"hadoop.profile"
	"hadoop-conf"
	"hadoop.sh"
	"hadoop-namenode.service"
	"hadoop-datanode.service"
	"hadoop-secondarynamenode.service"
	"hadoop-jobtracker.service"
	"hadoop-tasktracker.service"
)
backup=(
	etc/conf.d/${pkgname}
	etc/profile.d/${pkgname}.sh
	etc/${pkgname}/capacity-scheduler.xml
	etc/${pkgname}/configuration.xsl
	etc/${pkgname}/core-site.xml
	etc/${pkgname}/fair-scheduler.xml
	etc/${pkgname}/hadoop-env.sh
	etc/${pkgname}/hadoop-metrics2.properties
	etc/${pkgname}/hadoop-policy.xml
	etc/${pkgname}/hdfs-site.xml
	etc/${pkgname}/log4j.properties
	etc/${pkgname}/mapred-queue-acls.xml
	etc/${pkgname}/mapred-site.xml
	etc/${pkgname}/masters
	etc/${pkgname}/slaves
	etc/${pkgname}/ssl-client.xml.example
	etc/${pkgname}/ssl-server.xml.example
	etc/${pkgname}/taskcontroller.cfg
	etc/${pkgname}/task-log4j.properties
)

sha256sums=('ad270af05fff59d3f7021efe79328ed92dadfa64aa5ab4fcde4a204f803dbf9e' # [downloaded hadoop.tar]
            'b6607cb8531244d9be9241d8d4980d5695869f89fa598c8d24b35ec503df413b' # hadoop.profile
            'e584c32246fd23fe5f35b13399372419584c27a234364b12d1479f3c87e70748' # hadoop-conf
            '93cb40f76f6bb0c1924b7ef083b82d39bf32190f86c28fc6304839703cdda7b1' # hadoop.sh
            '3fd40045f7657881cde0abee4ac1735232ba3d79121d724f74707252e19088b3' # hadoop-namenode.service
            '230a58ab4e3462eb63662aee057965c5130247f7d9c98df83495c8da2c409fe5' # hadoop-datanode.service
            '047d3d6aea9eada82780eaa93a55c6259fb1b63c68bc50cc26323e066c1b7f75' # hadoop-secondarynamenode.service
            '5e9bc41b0086dfa7b237d1a7248a7f113299687f79ba0c58ba01eaeea0e35e79' # hadoop-jobtracker.service
            '37d7a252292b365782d9e7a64d6019a78d9c561acf9b5af3c246b602d3e0a8ec' # hadoop-tasktracker.service
)

if [ "$CARCH" = "i686" ]; then
    options=(!strip)
fi

compile() {
  cd $srcdir/${pkgname}-${pkgver}
  msg "Cleaning..."
  ant clean || return 1

  msg "Patching..."
  sed -i "s/${_devver}/${pkgver}/" build.xml
  sed -i "s|<ivysettings>|<ivysettings>\n<caches defaultCacheDir=\"${srcdir}/ivy_cache\"/>|" ivy/ivysettings.xml

  msg "Building..."
  ant -Dcompile.native=true bin-package || return 1
}

package() {
  _usr_lib=${pkgdir}/usr/lib
  _hadoop_real_home=$_usr_lib/$pkgname-$pkgver
  _hadoop_link_home=$_usr_lib/$pkgname

  mkdir -p ${_usr_lib} ${pkgdir}/usr/lib/systemd/system
  cp -r $srcdir/$pkgname-$pkgver $_usr_lib

  #
  install -Dm755 ${srcdir}/hadoop-conf ${pkgdir}/etc/conf.d/hadoop
  install -Dm755 ${srcdir}/hadoop.profile ${pkgdir}/etc/profile.d/hadoop.sh
  install -Dm644 ${srcdir}/hadoop-*.service ${pkgdir}/usr/lib/systemd/system/


  # we do not use soft link because we need put configures in backup array,
  # in order to preserve the conf when upgrade package.
  cp -r $_hadoop_real_home/etc/hadoop $pkgdir/etc
  mv $_hadoop_real_home/etc $_hadoop_real_home/orig_etc

  # todo: i need an own file :)
  mkdir -p $pkgdir/usr/bin
  echo -e '#!/bin/sh\n\nfor f in /etc/profile.d/*.sh\ndo\n. $f\ndone\n/usr/lib/hadoop/bin/hadoop "$@"' > $pkgdir/usr/bin/hadoop
  chmod 755 $pkgdir/usr/bin/hadoop

  cd $_usr_lib
  ln -s $pkgname-$pkgver $pkgname

  ## Disable IPv6 (comment out to disable IPv6 support):
  # sed -i 's|_OPTS="-D|_OPTS="-Djava.net.preferIPv4Stack=true -D|' hadoop-env.sh

  ## fix native 
  # if [ "$CARCH" = "i686" ]; then
  #   rm -rf lib/native/Linux-amd64-64
  #   cd lib/native/Linux-i386-32
  #   sed -i "s|dependency_libs='|dependency_libs='-L/opt/java/jre/lib/i386/server |" libhadoop.la
  # fi

  # if [ "$CARCH" = "x86_64" ]; then
  #   rm -rf lib/native/Linux-i386-32
  #   cd lib/native/Linux-amd64-64
  #   sed -i "s|dependency_libs='|dependency_libs='-L/opt/java/jre/lib/amd64/server |" libhadoop.la
  # fi

  ## Create some links, so Hadoop's KFS jar could access KFS libraries properly
  ## (it is still fine if KFS is not installed)

  # msg "Creating KFS links..."

  # for lib in libkfsClient libkfsCommon libkfsEmulator libkfsIO libkfsMeta; do
  #   for ext in a so; do
  #     ln -s /usr/lib/${lib}.${ext}
  #   done
  # done

  # ln -s /usr/lib/libkfs_access.so
}

