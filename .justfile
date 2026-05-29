[private]
@default:
  just --list

sha256sum version:
  sha256sum which-key-wayland-{{version}}.tar.gz | awk '{print $1}'

# vim: set ts=2 sw=2 sts=2 et:
