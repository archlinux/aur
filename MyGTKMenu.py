import os.path, MenuMaker, Prophet




from MenuMaker import indent, writeFullMenu




menuFile = "~/.mygtkmenu.txt"




def _map(x) :
	for d, s in (("\'", "\""),) :
		x = x.replace(s, d)
	return x




class Sep(object) :
	def emit(self, level) :
		return ['%sSEPARATOR' % indent(level)]




class App(object) :
	def emit(self, level) :
		x = indent(level)
		cmd = self.app.execmd
		if self.app.terminal :
			cmd = MenuMaker.terminal.runCmd(cmd)
		return [
			'%sitem = %s' % (x, _map(self.app.name)),
			'%scmd = %s' % (x, cmd),
			'%sicon = NULL' % x,
			''
		]



class Menu(object) :
	def emit(self, level) :
		menu = ['%sSubmenu = %s' % (indent(level), _map(self.name)),
			'%sicon = NULL' % indent(level + 1),
			''
		]
		for x in self :
			menu += x.emit(level + 1)
		return menu




class Root(object) :
	def __init__(self, subs) :
		if writeFullMenu :
			subs = subs + [MenuMaker.Sep(), SysMenu()]
		super(Root, self).__init__(subs)
	def emit(self, level) :
		if writeFullMenu :
			menu = [
				'iconsize = 25'
			]
			for x in self :
				menu += x.emit(level)
			menu.append('')
			return menu
		else :
			menu = []
			for x in self :
				menu += x.emit(level)
			return menu




class SysMenu(MenuMaker.Menu) :
	name = "Session"
	def __init__(self) :
		subs = [
			X('item = Log Out'),
			X('cmd = killall X'),
			X('icon = NULL')
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
