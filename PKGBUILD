# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=thinkmeta-concurrenttasks-core
pkgver=0.5.1
pkgrel=1
pkgdesc="Scheduler runtime required by the ThinkMeta concurrent-task encoders"
arch=('x86_64')
url="https://github.com/ThinkMeta-com/ThinkMeta.ConcurrentTasks.Samples"
license=('custom:ThinkMeta')
depends=('glibc')
provides=('libThinkMeta.ConcurrentTasks.Core.so=2-64')
options=('!strip' '!debug')
# Strip and debug stay off because the licence allows the core to be copied only
# unchanged: repackaging these bytes would breach it, and -debug would point at
# symbols no user can obtain anyway.
source=("samples-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f1117aae9b0a3d042f39c9bf8049d3372ecb1a17497e1b039dcede7ca1f791eb')

_latestver() {
  gh api --paginate repos/ThinkMeta-com/ThinkMeta.ConcurrentTasks.Samples/tags --jq '.[].name' |
    sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}
latestver() { _latestver; }

package() {
  local top="${srcdir}/ThinkMeta.ConcurrentTasks.Samples-${pkgver}"

  # Every ct* folder ships its copy of the core and each binary loads whichever
  # sits beside it, so a version that differs between folders would make the
  # installed runtime wrong for some encoders and right for others.
  [[ $(sha256sum "${top}"/ct*/bin/linux-x64/libThinkMeta.ConcurrentTasks.Core.so.2 |
    awk '{print $1}' | sort -u | wc -l) -eq 1 ]]

  install -Dm755 "${top}/ctDeflate/bin/linux-x64/libThinkMeta.ConcurrentTasks.Core.so.2" \
    "${pkgdir}/usr/lib/libThinkMeta.ConcurrentTasks.Core.so.2"
  install -Dm644 "${top}/ctDeflate/LICENSE-Core.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-Core.txt"
}
