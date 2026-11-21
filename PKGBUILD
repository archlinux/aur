# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=thinkmeta-concurrenttasks-core
pkgver=0.6.0
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
sha256sums=('dfec9feffaca9a0ede5370ec045da5cf0f222c4498daf7f88e30e34f0f77c4c7')
# The terms say they are provisional and will be replaced by the complete licence,
# so these bytes can change without a version change. Pin the reviewed text: a
# rewrite then fails the build instead of shipping under terms nobody read. This
# covers only the file named here; a replacement arriving as a different file has
# to be caught by reading the folder at each bump, which is what the pin forces.
_core_terms_sum='4667f8f0304ee85939bf69db8efdf7d1c1172cbb28747a1f4e138a6f3dd936fd'

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

  if ! echo "${_core_terms_sum}  ${top}/ctDeflate/LICENSE-Core.txt" | sha256sum -c --status; then
    error "the core licence text is not the one reviewed; read it and update _core_terms_sum if the new terms are acceptable"
    return 1
  fi

  install -Dm755 "${top}/ctDeflate/bin/linux-x64/libThinkMeta.ConcurrentTasks.Core.so.2" \
    "${pkgdir}/usr/lib/libThinkMeta.ConcurrentTasks.Core.so.2"
  install -Dm644 "${top}/ctDeflate/LICENSE-Core.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-Core.txt"
}
