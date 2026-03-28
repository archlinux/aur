# Maintainer: nardholio <nardholio@gmail.com>
pkgname=magicmaze-git
pkgver=preliminary_release_1_5_1_alpha2.r21.g705ef99
pkgrel=1
pkgdesc="Simple low-tech monster-bashing maze game inspired by Gauntlet II (Ruby/SDL2 port). Requires AUR version of sdl2"
arch=('any')
url="https://github.com/kentdahl/magic_maze"
license=('GPL-2.0-or-later')
depends=('ruby-sdl2' 'ruby-getoptlong')
makedepends=('git')
source=(${pkgname}::"git+${url}.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"

  install -dm755 "${pkgdir}/usr/share/magicmaze"
  cp -r data/. "${pkgdir}/usr/share/magicmaze/"

  install -dm755 "${pkgdir}/usr/lib/magicmaze/magicmaze/"
  cp -r magicmaze/. "${pkgdir}/usr/lib/magicmaze/magicmaze/"

  install -Dm644 data/gfx/logo.svg "${pkgdir}/usr/share/pixmaps/magicmaze.svg"

  install -Dm644 data/misc/com.github.kentdahl.magic_maze.desktop \
    "${pkgdir}/usr/share/applications/com.github.kentdahl.magic_maze.desktop"
  install -Dm644 data/misc/com.github.kentdahl.magic_maze.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/com.github.kentdahl.magic_maze.metainfo.xml"

  # Wrapper script
  install -Dm755 /dev/null "${pkgdir}/usr/bin/magicmaze"
  cat > "${pkgdir}/usr/bin/magicmaze" << 'EOF'
#!/usr/bin/env ruby

$LOAD_PATH.unshift '/usr/lib/magicmaze'
require 'magicmaze/cli'
cli = MagicMaze::CLI.new
cli.default_option_settings = {
  sound: true,
  datadir: '/usr/share/magicmaze/',
}
options = cli.parse_options
if options[:scale]
  scale = options[:scale]
  Object.const_set(:OVERRIDE_GRAPHICS_SCALE_FACTOR, scale)
  module MagicMaze
    class Graphics
      const_set(:OVERRIDE_GRAPHICS_SCALE_FACTOR, Object.const_get(:OVERRIDE_GRAPHICS_SCALE_FACTOR))
    end
  end
end
if options[:engine]
  Object.const_set(:OVERRIDE_GRAPHICS_ENGINE, options[:engine])
end
require 'magicmaze/magicmaze'
MagicMaze::Game.new(options).loop
EOF
  chmod +x "${pkgdir}/usr/bin/magicmaze"

  install -Dm644 /dev/null "${pkgdir}/usr/share/man/man6/magicmaze.6"
  cat > "${pkgdir}/usr/share/man/man6/magicmaze.6" << 'EOF'
.\" Hey, EMACS: -*- nroff -*-
.\" First parameter, NAME, should be all caps
.\" Second parameter, SECTION, should be 1-8, maybe w/ subsection
.\" other parameters are allowed: see man(7), man(1)
.TH MAGICMAZE 6 "July 20, 2008"
.\" Please adjust this date whenever revising the manpage.
.\"
.\" Some roff macros, for reference:
.\" .nh        disable hyphenation
.\" .hy        enable hyphenation
.\" .ad l      left justify
.\" .ad b      justify to both left and right margins
.\" .nf        disable filling
.\" .fi        enable filling
.\" .br        insert line break
.\" .sp <n>    insert n+1 empty lines
.\" for manpage-specific macros, see man(7)
.SH NAME
magicmaze \- simple monster-bashing game
.SH SYNOPSIS
.B magicmaze
.RI [ options ]
.SH DESCRIPTION
This manual page documents briefly the
.B magicmaze
command.
.PP
\fBmagicmaze\fP is a simple and low-tech monster-bashing maze game. 
It was originally inspired by playing Gauntlet II on the Atari ST.
.SH OPTIONS
These programs follow the usual GNU command line syntax, with long
options starting with two dashes (`-').
A summary of options is included below.
.TP
.B \-D, \-\-savedir \fIdir\fP
Specify the directory for the saved game.  The default is
.IB $HOME /.magicmaze
.TP
.B \-f, \-\-fullscreen
Start in full-screen mode.
.TP
.B \-h, \-\-help
Show summary of options.
.TP
.B \-j, \-\-joystick \fP[\fI#\fP]
Enable joystick mode, optionally specifying which joystick to use.
.TP
.B \-L, \-\-loadgame
Load and continue playing saved game.
.TP
.B \-l, \-\-level \fI1-10\fP
Start on a particular level.
.TP
.B \-S, \-\-nosound
Disables the sound output.
.TP
.B \-s, \-\-scale \fI1-5\fP
Specify graphical resolution scaling.
.TP
.B \-v, \-\-volume \fI1-10\fP
Set the volume of the sound.
.SH AUTHOR
\fBmagicmaze\fP was written by Kent Dahl <kentda@pvv.org>.
.PP
This manual page was written by Joe Nahmias <jello@debian.org>,
for the Debian project (but may be used by others).
EOF
}
