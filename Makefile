#
#   Copyright (C) 2018-2020 CASM Organization <https://casm-lang.org>
#   All rights reserved.
#
#   Developed by: Philipp Paulweber
#                 <https://github.com/casm-lang/casm-lang.pkg.archlinux>
#
#   This file is part of casm-lang.pkg.archlinux.
#
#   casm-lang.pkg.archlinux is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   casm-lang.pkg.archlinux is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with casm-lang.pkg.archlinux. If not, see <http://www.gnu.org/licenses/>.
#


default: install


install:
	makepkg -si

update:
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -fr src
	rm -fr pkg
	rm -f  *.tar.gz
	rm -f  *.tar.xz
