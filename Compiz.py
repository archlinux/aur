import MenuMaker




from MenuMaker import indent, writeFullMenu




menuFile = "~/.config/compiz/deskmenu/menu.xml"




def _map(x) :
	for d, s in (("&amp;", "&"), ("\'", "\"")) :
		x = x.replace(s, d)
	return x




class Sep(object) :
	def emit(self, level) :
		return ['%s<separator/>' % indent(level)]




class App(object) :
	def emit(self, level) :
		x = indent(level)
		xx = indent(level + 1)
		cmd = self.app.execmd
		if self.app.terminal :
			cmd = MenuMaker.terminal.runCmd(cmd)
		return [
			'%s<item type="launcher">' % x,
			'%s<name>%s</name>' % (x, _map(self.app.name)),
			'%s<command>%s</command>' % (x, cmd),
			'%s</item>' % x
		]



class Menu(object) :
	def emit(self, level) :
		menu = ['%s<menu name="%s">' % (indent(level),  _map(self.name))]
		for x in self :
			menu += x.emit(level + 1)
		menu.append('%s</menu>' % indent(level))
		return menu


class Root(object) :
	def __init__(self, subs) :
		if writeFullMenu :
			subs = subs + [MenuMaker.Sep(), SysMenu()]
		super(Root, self).__init__(subs)
	def emit(self, level) :
		if writeFullMenu :
			menu = [
				'<menu>'
			]
			for x in self :
				menu += x.emit(level)
			menu.append('</menu>')
			return menu
		else :
			menu = []
			for x in self :
				menu += x.emit(level)
			return menu





class SysMenu(MenuMaker.Menu) :
	name = "Compiz"
	def __init__(self) :
		subs = [
			X('<item type="launcher">'),
			X('	<name>Edit Menu</name>'),
			X('	<icon>gtk-edit</icon>'),
			X('	<command>compiz-deskmenu-editor</command>'),
			X('</item>'),
			X('<item type="viewportlist"/>'),
			X('<item type="reload"/>'),
			MenuMaker.Sep(),
			X('<item type="launcher">'),
			X('	<name>Logout</name>'),
			X('	<icon>gnome-session-logout</icon>'),
			X('	<command>killall X</command>'),
			X('</item>')
		]
		super(SysMenu, self).__init__(subs)
		self.align = MenuMaker.Entry.StickBottom




class X(MenuMaker.Entry) :
	def __init__(self, x) :
		super(X, self).__init__()
		self.align = MenuMaker.Entry.StickBottom
		self.x = x
	def emit(self, level) :
		return [indent(level) + self.x]
