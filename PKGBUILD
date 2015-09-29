# Maintainer: William Di Luigi <williamdiluigi@gmail.com>

# chosen at random
CMSUSER_GID=26950

pkgname=cms-git
pkgver=r3154.52af128
pkgrel=1
pkgdesc="CMS, or Contest Management System, is a distributed system for running and (to some extent) organizing a programming contest."
arch=('any')
url="http://cms-dev.github.io/"
license=('AGPL3')
depends=(
  'isolate' 'testlib' 'postgresql' 'postgresql-libs' 'python2' 'iso-codes' 'shared-mime-info'
)
optdepends=(
  'fpc: support for Pascal submissions'
  'sgi-stl-doc: support for STL documentation inside the contest'
)
makedepends=(
  'git'
  'python-virtualenv'
)
provides=('cms')
conflicts=('cms')
install=$pkgname.install

source=(
  'git://github.com/cms-dev/cms.git'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd cms
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd cms

  # Apply patch: Add --as-root option to prerequisites.py
  curl https://github.com/wil93/cms/commit/94e36179062f9b5c73330e046524801ef2bfeb2a.diff | patch -p1
  # Apply patch: Update location and installation of localization files
  curl https://github.com/wil93/cms/commit/bea5b5a994defe4081563161f746b528964642d8.diff | patch -p1

  # Configuration files
  install -D -m660 -g$CMSUSER_GID config/cms.conf.sample $pkgdir/usr/lib/cms/cms.conf
  install -D -m660 -g$CMSUSER_GID config/cms.ranking.conf.sample $pkgdir/usr/lib/cms/cms.ranking.conf

  # Logs and cache directories
  install -d -m770 -g$CMSUSER_GID $pkgdir/var/log/cms
  install -d -m770 -g$CMSUSER_GID $pkgdir/var/cache/cms

  # I'm not even sure if this is needed at all
  install -d -m770 -g$CMSUSER_GID $pkgdir/var/lib/cms

  # Fix testlib.h path (maybe patch CMS for this?)
  install -d -m755 $pkgdir/usr/include/cms
  ln -s /usr/include/testlib.h $pkgdir/usr/include/cms/testlib.h

  # Prepare virtual environment
  virtualenv -p python2 $pkgdir/usr/lib/cms/venv
  source $pkgdir/usr/lib/cms/venv/bin/activate
  pip install -r requirements.txt

  # Build localization files
  ./prerequisites.py build_l10n --as-root

  # Install the cms python package
  python setup.py install

  # This will hopefully go away with https://github.com/cms-dev/cms/issues/281
  install -d $pkgdir/usr/bin
  for cmd in \
    cmsContestWebServer cmsResourceService cmsScoringService cmsDropDB \
    cmsPrintingService cmsInitDB cmsAdminWebServer cmsWorker cmsChecker \
    cmsEvaluationService cmsProxyService cmsRankingWebServer cmsLogService \
    cmsSpoolExporter cmsTestFileCacher cmsAdaptContest cmsAddTask cmsMake \
    cmsYamlImporter cmsRunTests cmsRWSHelper cmsRemoveTask cmsAddUser \
    cmsContestExporter cmsDumpUpdater cmsDumpExporter cmsYamlReimporter \
    cmsContestImporter cmsAddContest cmsComputeComplexity cmsRemoveUser \
    cmsDumpImporter cmsReplayContest
  do
    # Fix the shebang
    sed -i "s|$pkgdir/usr/lib/cms/venv|/usr/lib/cms/venv|" $pkgdir/usr/lib/cms/venv/bin/$cmd

    # Create link
    ln -s /usr/lib/cms/venv/bin/$cmd $pkgdir/usr/bin/$cmd
  done

  # The following will also go away eventually (I hope :/)
  install -d $pkgdir/var/local/log
  install -d $pkgdir/var/local/cache
  install -d $pkgdir/var/local/lib
  install -d $pkgdir/var/local/run
  ln -s /var/log/cms $pkgdir/var/local/log/cms
  ln -s /var/cache/cms $pkgdir/var/local/cache/cms
  ln -s /var/lib/cms $pkgdir/var/local/lib/cms
  ln -s /var/run/cms $pkgdir/var/local/run/cms
}
